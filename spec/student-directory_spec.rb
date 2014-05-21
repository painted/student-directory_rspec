require 'student-directory'

describe 'load data'  do
	
	it 'knows the directory is made of a list' do
		expect(student_list).to eq Array.new
	end

	it 'knows that a .csv file exists' do
		create_csv('directory.csv')
		expect(File.exist?("directory.csv")).to be_true
	end

	it 'reads data from the .csv file' do
		expect(CSV).to receive(:foreach).with("directory.csv")
		load_csv("directory.csv")
	end

	# it 'knows when the file is not empty' do
	# 	load_csv("directory.csv")
	# 	expect(student_list[0]).not_to be_empty
	# end


end

describe 'add student' do

	it 'adds a student by name George' do
		add_student_name('George')
		expect(@students[0][:name]).to eq 'George'
	end

	it 'adds value to student for cohort May' do
		add_student_cohort(:May)
		expect(@students[0][:cohort]).to eq :May
	end

	it 'adds value to student for email' do
		add_student_email('fsggfgs@dsff.com') 
		expect(@students[0][:email]).to eq 'fsggfgs@dsff.com'
	end

	it 'checks to make sure the email includes @' do
		add_student_email('fsggfgs@dsff.com') 
		expect(check_email?).to be_true
	end

	it  'adds value to student for student id with length of 10' do
		add_student_id('1234567891')
		expect(@students[0][:rg].length).to eq 10
	end

	it 'checks to make sure the first student has all above values' do
		add_student('George', :May, 'fsggfgs@dsff.com', '1234567891')
		expect(@students[0].values).to eq ["George", :May, "fsggfgs@dsff.com", "1234567891"]
	end
	it 'adds two students to the list' do
		add_student('George', :May, 'fsggfgs@dsff.com', '1234567891')
		add_student('John', :May, 'fsgsgss@dsff.com', '1234567890')
		expect(@students.length).to eq 2
	end
end

describe 'write students to csv' do

	it 'writes the student list with values to the csv file' do
		add_student('George', :May, 'fsggfgs@dsff.com', '1234567891')
		add_student('John', :May, 'fsgsgss@dsff.com', '1234567890')
		write_to_csv("directory.csv")
		load_csv("directory.csv")
		expect(student_list).to_not be_empty
		# expect(CSV).to receive(:open).with("directory.csv", 'w')

	end

	# it 'knows that we do not want duplicate entries' do
	# 	load_csv("directory.csv")
	# 	add_student('George', :May, 'fsggfgs@dsff.com', '1234567891')

end

describe 'delete students' do

	it 'deletes a student from the list' do
		add_student('George', :May, 'fsggfgs@dsff.com', '1234567891')
		add_student('John', :May, 'fsgsgss@dsff.com', '1234567890')	
		delete_student('1234567890')
		expect(student_list.length).to eq 1
	end
	# it 'deletes a student from the csv file'
	# 	load_csv("directory.csv")
	# 	delete_student('George')
	# 	expect(student_list.length).to eq 1
	# end
end

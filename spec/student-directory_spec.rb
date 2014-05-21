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

	it 'knows when the file is not empty' do
		load_csv("directory.csv")
		expect(student_list[0]).not_to be_empty
	end


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

end

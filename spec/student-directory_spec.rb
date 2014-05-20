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
		load_csv(filename)
	end

end
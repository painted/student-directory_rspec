require 'csv'

def student_list
	@students = []
end

def create_csv(filename)
	CSV.open(filename, 'w')
end

def load_csv(filename)
	CSV.foreach(filename) do |row|
		row
	end
end

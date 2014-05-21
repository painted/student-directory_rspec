require 'csv'

def student_list
	@students ||= []
end

def create_csv(filename)
	CSV.open(filename, 'a')
end

def load_csv(filename)
	CSV.foreach(filename) do |row|
		@students = row
	end
end

def add_student(name, cohort, email)
	add_student_name(name)
	add_student_cohort(cohort)
	add_student_email(email)
end

def add_student_name(name)
	student_list << {name: name}
end

def add_student_cohort(cohort)
	student_list << {cohort: cohort}
end

def add_student_email(email)
	student_list << {email: email}
end

def check_email?
	@students[0][:email].include? "@"
end

def add_student_id(rg)
	student_list << {rg: rg}
end


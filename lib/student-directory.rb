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

def add_student(name, cohort, email, rg)
	student_list << {name: name, cohort: cohort, email: email, rg: rg}
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

def write_to_csv(filename)
	CSV.open(filename, "w") do |csv|
		@students.each do |student|
		  csv << [student[:name], student[:cohort], student[:email], student[:rg]]
		 end
	end
end

def delete_student(rg)
	student_list.delete_if {|hash| hash[:rg] == rg}
end 





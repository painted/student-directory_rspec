require 'csv'

def student_list
	@students ||= []
end

def create_csv(filename)
	CSV.open(filename, 'a')
end

def load_csv(filename)
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort, email, rg = line.chomp.split(',')
		add_student(name, cohort, email, rg)
	end
	file.close
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

def delete_student(rg, filename)
	student_list.delete_if {|hash| hash[:rg] == rg}
	write_to_csv(filename)
end 

def menu_items
	items = ["1) Enter the students.", "2) Show students.", "3) Save students", "4) Delete students", "5) Load students", "9) Exit"]
end



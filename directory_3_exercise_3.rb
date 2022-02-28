def get_name
  return gets.chomp.capitalize
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = get_name

  while !name.empty? do 
    students << {name: name, cohort: :november} 
    puts "Now we have #{students.count} students"
    name = get_name
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  students.each_with_index { |student, index| puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

def print_specific_letter(students)
  puts "Now select only students beginning with a specific letter: "
  name = get_name
  letter = name.chr
  students.each_with_index {|student, index| (student[:name].chr == letter ? (puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)") : ()) }
end

def print_shorter_than_twelve(students)
  puts "Here are the students with a name shorter than 12 characters: "
  students.each_with_index {|student, index| (student[:name].length < 12 ? (puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)") : ())}
end

students = input_students

print_header
print(students)
print_footer(students)
#print_specific_letter(students)
print_shorter_than_twelve(students)
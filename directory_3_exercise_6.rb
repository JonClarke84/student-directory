class String  
  def titleize
    self.split(/ |\_/).map(&:capitalize).join(" ")
  end
end

def get_student
  student = {
    name: "",
    hobbies: "",
    birthplace: "",
    cohort: "November"
  }

  print "Enter name: "
  name = gets.chomp.titleize
  student[:name] = name
  if !name.empty?
    print "Enter hobbies: "
    hobbies = gets.chomp.titleize
    student[:hobbies] = hobbies
    print "Enter birthplace: "
    birthplace = gets.chomp.titleize
    student[:birthplace] = birthplace
  end
  return student
end

def input_students
  puts "Please enter the details of the students"
  puts "To finish, just hit ENTER twice"

  students = []

  student = get_student

  while !student[:name].empty? do 
    students << student 
    puts students.length == 1 ? ("Now we have #{students.length} student") : ("Now we have #{students.length} students")
    puts "Enter another, or hit ENTER to finish"
    student = get_student
  end
  return students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------------------------".center(50)
end

def print_students(students)
  students.each_with_index {|student, index| puts "#{index+1}. Name: #{student[:name]}, Hobbies: #{student[:hobbies]}, Birthplace: #{student[:birthplace]}. (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

def print_specific_letter(students)
  puts "Now select only students beginning with a specific letter: "
  name = get_student
  letter = name.chr
  students.each_with_index {|student, index| (student[:name].chr == letter ? (puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)") : ()) }
end

def print_shorter_than_twelve(students)
  puts "Here are the students with a name shorter than 12 characters: "
  students.each_with_index {|student, index| (student[:name].length < 12 ? (puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)") : ())}
end

students = input_students

print_header
print_students(students)
print_footer(students)
#print_specific_letter(students)
#print_shorter_than_twelve(students)
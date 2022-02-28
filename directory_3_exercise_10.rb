class String  
  def titleize
    self.split(/ |\_/).map(&:capitalize).join(" ")
  end
end

def months_of_the_year
    months_array = []
    count = 1
    while count <= 12
      time = Time.new(0, count)
      months_array << time.strftime("%B")
      count += 1
    end
    return months_array
  end

def enter_cohort
  current_month = Time.now.strftime("%B")
  print "Enter the cohort (press ENTER to default to #{current_month}): "
  input_month = gets.chop.capitalize

  while !months_of_the_year.include?(input_month)
    if input_month.empty?
      return current_month.to_sym
    else
      print "Typo? Please ensure you have typed the month correctly (press ENTER to default to #{current_month}): "
      input_month = gets.chop.capitalize
    end
  end
  return input_month.to_sym
end

def get_student
  student = {
    name: "",
    hobbies: "",
    birthplace: "",
    cohort: ""
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
    student[:cohort] = enter_cohort
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
  puts "--------------------------------".center(50)
  students.each_with_index {|student, index| puts "#{index+1}. Name: #{student[:name]}, Hobbies: #{student[:hobbies]}, Birthplace: #{student[:birthplace]}. (#{student[:cohort]} cohort)" }
end

def print_students_by_month(students)
  months_used = []
  month_counter = 1

  months_used = students.map { |student| student[:cohort] }
  months_used.uniq!

  while month_counter <= months_used.length
    temp_month = []
    students.each {|student| student[:cohort] == months_used[month_counter-1] ? temp_month << student : () }
    print_students(temp_month)
    month_counter += 1
  end
end
  


def print_footer(students)
  students.length == 1 ? (puts "We have #{students.count} great student.") : (puts "Overall, we have #{students.count} great students.")
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
print_students_by_month(students)
print_footer(students)
#print_specific_letter(students)
#print_shorter_than_twelve(students)
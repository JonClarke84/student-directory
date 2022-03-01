require 'csv'

@students = []


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student_to_list(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
  puts "You have finished inputting students. Please make another choice."
end

def print_header
  if @students.length > 0
    puts "The students of my cohort at Makers Academy"
    puts "-------------"
  end
end

def print_students
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
  if @students.length > 0
    puts "Overall, we have #{@students.count} great students"
  else
    puts "We have no students"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def add_student_to_list(name, cohort = Time.now.strftime("%B"))
  @students << {name: name, cohort: cohort.to_sym}
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "ERROR"
  end
end

def save_students
  file = File.open("students.csv", "w") do |file|
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
    end
  end
  puts "Students succssefully saved."
end

# def load_students(filename = "students.csv")
#   file = File.open(filename, "r") do |file|
#   file.readlines.each do |line|
#     name, cohort = line.chomp.split(',')
#     add_student_to_list(name, cohort)
#     end
#   end
#   puts "Students successfully loaded."
# end

def load_students(filename = "students.csv")
  file = File.open(filename, "r") do |file|
    CSV.new(file).to_a.each do |student|
    @students << {name: student[0], cohort: student[1]}
    end
  end
  puts "Files successfully loaded"
end

def try_load_students
  if filename = ARGV.first
    return filename
  elsif File.exists?("students.csv")
    filename = "students.csv"
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu

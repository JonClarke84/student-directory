@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
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
    puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp

    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "ERROR"
    end
  end
end

interactive_menu

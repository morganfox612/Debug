require 'faker'
require 'pry'
require './student'
require './classroom'
require './grade'
#these are the gem files that are being accessed within these apps

# Our four classrooms for the first years
@A = Classroom.new("1A")
@B = Classroom.new("1B")
@C = Classroom.new("1C")
@D = Classroom.new("1D")

# Create test students with grades in various subjects
def generate_student
s = Student.new(Faker::Name.name, rand(11..20))
  s.report_card.add_grade("Math", rand(0..100))
  s.report_card.add_grade("History", rand(0..100))
  s.report_card.add_grade("English", rand(0..100))
  s.report_card.add_grade("Science", rand(0..100))
  return s #the s alone before just worked as a return value for the grade variables
end

# Generate our students
1..25.times do |i|
  @A.add_student(generate_student)
end
1..25.times do |i|
  @B.add_student(generate_student)
end
1..25.times do |i|
  @C.add_student(generate_student)
end
1..25.times do |i|
  @D.add_student(generate_student)
end

def find_failing(classroom)
  classroom.students.each { |key, value|
    total = 0
    value.report_card.grades.each do |key, value|
      total = total + value
    end
    if total > 200
      puts "#{value.report_card.grades}"
      puts "#{value.name} PASSES with a #{total}"
      puts ""
    else
      puts "#{value.report_card.grades}"
      puts "#{value.name} FAILS with a #{total}"
      puts""
    end
    }
end
find_failing(@A)

############################################################
# CHALLENGE 2
def find_exceptional(classroom)
  classroom.students.each { |key, value|
    total = 0
    value.report_card.grades.each do |key, value|
      total = total + value
    end
    if total > 260 #this shows that if the total is greater than 260 you run this if statement
      puts "#{value.report_card.grades}"
      puts "#{value.name} did EXCEPTIONALLY well with a #{total}" #this gives a message of "Way to go!" if a student passed with higher than 260
      puts ""
    end
    }
    puts "\n\n"
end

find_exceptional(@B) #this calls onto the function and passes an argument

############################################################

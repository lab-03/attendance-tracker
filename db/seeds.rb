# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def create_user(type) #1 for Lecturer else for Student
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  phone = Faker::PhoneNumber.phone_number
  email = first_name + last_name + "@gmail.com"
  pass = (Faker::Number.number(digits: 9)).to_s
  userable_id = Faker::Number.number(digits: 6)
  s = nil
  if type == 1
    s = Lecturer.new.user
  else
    s = Student.new.user
  end
  s.first_name = first_name
  s.last_name = last_name
  s.email = email
  s.password = pass
  s.phone = phone
  s.userable_id = userable_id
  s.save
  if type == 1
    s = Lecturer.create(id: userable_id, user_id: userable_id)
  else
    s = Student.create(id: userable_id, user_id: userable_id)
  end

  s
end

def create_course
  name = Faker::ProgrammingLanguage.name
  Course.create(name: name)
end

def create_coursegroup(course_id)
  group_id = Faker::Number.number(digits: 2)
  CourseGroup.create(course_id: course_id, group_id: group_id)
end

def create_attendance(course_id, course_group_id, type, student_id)
  Attendance.create(course_id: course_id, course_group_id: course_group_id, type: type, student_id: student_id)
end

def init_database
  stud_arr = []
  6.times do
    puts "creating users"
    l1 = create_user(1)
    puts "creating users"
    l2 = create_user(1)
    puts "creating course"
    c = create_course()
    puts "creating course group"
    cg = create_coursegroup(c.id)
    puts "assigning lectures"
    c.lecturers << l1
    c.lecturers << l2
  end

  puts "creating 20 students "
  20.times do |stud_num|
    s = create_user(2)
    stud_arr.push(s)
    puts "Student no. #{stud_num}"
  end

  puts "creating courses"
  6.times do |course_num|
    courses = Course.all
    courses.each do |c|
      stud_arr.each { |stud| c.students << stud }
    end
    puts "course no. #{course_num} is created!"
  end
end

init_database

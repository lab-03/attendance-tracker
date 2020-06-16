# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def create_user(type)#1 for Lecturer else for Student
	first_name=Faker::Name.first_name
    last_name=Faker::Name.last_name
    phone=Faker::PhoneNumber.phone_number
    email=first_name+last_name+"@gmail.com"
    pass=(Faker::Number.number(digits: 9)).to_s
    userable_id=Faker::Number.number(digits: 6)
    s = nil
    if(type==1)
    	s = Lecturer.new.user
    else 
        s = Student.new.user	
    end
	s.first_name=first_name
	s.last_name=last_name
	s.email=email
    s.password=pass
    s.phone=phone
    s.userable_id=userable_id
    s.save
    if(type==1)
    	s=Lecturer.create(id: userable_id, user_id: userable_id)
    else 
    	s=Student.create(id: userable_id, user_id: userable_id)
    end

    return s
end

def create_course()
	name=Faker::ProgrammingLanguage.name
	c=Course.create(name: name)
	return c
end
def create_coursegroup(course_id)
	group_id=Faker::Number.number(digits: 2)
	cg=CourseGroup.create(course_id: course_id, group_id: group_id)
	return cg
end

def create_attendance(course_id,course_group_id,type,student_id)
	a=Attendance.create(course_id: course_id, course_group_id: course_group_id, type: type ,student_id: student_id)
	return a
end


stud_arr=Array.new
6.times do
l1=create_user(1)
l2=create_user(1)
c=create_course()
cg=create_coursegroup(c.id)


c.lecturers << l1
c.lecturers << l2
end

20.times do
s=create_user(2)
stud_arr.push(s)
end

Course.all.each{|c|
stud_arr.each{ |stud|
c.students << stud
}



}





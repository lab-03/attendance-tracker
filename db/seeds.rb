# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
for i in 1..5 do
	
stud_name=Faker::Name.name+(i).to_s+"@gmail.com"
stud_pass=Faker::Number.number(digits: 8)
lec_name=Faker::Name.name+(i).to_s+"@gmail.com"
lec_pass=Faker::Number.number(digits: 8)
s=Student.new
l=Lecturer.new
s=s.user
l=l.user
s.email=stud_name
s.password=stud_pass
l.email=lec_name
l.password=lec_pass
s.save
l.save

end




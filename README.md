# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Requirements

Rails >= 6.0
Ruby>=2.6.5

* Database creation

rails g model User Course name:string

rails g model User Course_Group course_id:string group_id:string

rails g model User Course Attendance course_id:string course_group_id:string type:string student_id:string

* Database initialization

rake db:migrate

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

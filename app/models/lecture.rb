class Lecture < ActiveRecord::Base
   attr_accessible :title, :active, :currenttopic, :starttime, :endtime
   has_many :students_lectures
   has_many :students, :through => :students_lectures
   has_many :instructors
end

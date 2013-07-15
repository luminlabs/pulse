class Lecture < ActiveRecord::Base
   attr_accessible :title, :currenttopic, :starttime, :endtime
   has_many :students
   has_many :instructors
end

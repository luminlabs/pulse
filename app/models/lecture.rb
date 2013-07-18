class Lecture < ActiveRecord::Base
   attr_accessible :title, :active, :currenttopic, :starttime, :endtime
   has_one :instructor
   has_many :rosters
   has_many :lectures, through: :rosters
end

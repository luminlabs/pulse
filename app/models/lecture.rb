class Lecture < ActiveRecord::Base
   attr_accessible :title, :active, :currenttopic, :starttime, :endtime
   attr_accessor :notcount, :followingcount, :goaheadcount 

   has_many :rosters
   has_many :users, through: :rosters
end

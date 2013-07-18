class Roster  < ActiveRecord::Base
     attr_accessible :user_id, :lecture_id# attr_accessible :title, :body

  belongs_to :lecture
  belongs_to :user
  
end

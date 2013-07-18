class RosterController < ApplicationController

 def new()
    
  end
  def create
    roster = Roster.create(params[:roster])
    redirect_to(lecture)
  end

end

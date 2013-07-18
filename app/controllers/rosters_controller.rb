class RosterController < ApplicationController

  

  def create
    roster = Roster.create(params[:roster])
    redirect_to(lecture)
  end

end

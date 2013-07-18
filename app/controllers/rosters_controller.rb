class RosterController < ApplicationController

 def new(Lecture lec)
    @roster = Roster.new(@lecture)
  end
  def create
    roster = Roster.create(params[:roster])
    redirect_to(lecture)
  end

end

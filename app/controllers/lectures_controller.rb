class LecturesController < ApplicationController
  def index
    @lectures = Lecture.all
    current_user.rosters.each { | i |
    i.destroy
  }

  end
  def new
    @lecture = Lecture.new
    @lecture.notcount = 0
    @lecture.followingcount = 0 
    @lecture.goaheadcount = 0
  end

  def create
    @lecture = Lecture.create(params[:lecture])
    @lecture.notcount = 0
    @lecture.followingcount = 0 
    @lecture.goaheadcount = 0
    redirect_to(lectures_path)
  end

  def show
    if params[:id].to_i > Lecture.count
      redirect_to(lectures_path)
    end
    @lecture = Lecture.find(params[:id])
    if current_user.instructor? 
      idlecount = 0
      
      @lecture.notcount = 0
      @lecture.followingcount = 0 
      @lecture.goaheadcount = 0

      @lecture.users.each do |user|
        case user.currentstatus
          when 0 then idlecount = idlecount + 1
          when 1 then @lecture.notcount = @lecture.notcount + 1 
          when 2 then @lecture.followingcount = @lecture.followingcount + 1
          when 3 then @lecture.goaheadcount = @lecture.goaheadcount + 1
      end
     end
    
    end 

    if !current_user.instructor? 

        roster = Roster.find_or_create_by_user_id_and_lecture_id(user_id: current_user.id, lecture_id: @lecture.id)  
        # binding.pry 

    end      

    # <%= debug @lecture %>
    
     # @notcount = @lecture.users.where(:status => 1).count
     # @followingcount = @lecture.users.where(:status => 2).count
     # @goaheadcount = @lecture.users.where(:status => 3).count

    # roster = @lecture.rosters.build()
    # roster.user_id = current_user.id
   # puts "ID:" + roster.user_id.to_s() + "User:" + roster.lecture_id.to_s
    # roster = Roster.new(user_id: current_user.id, lecture_id: params[:id])

  end
  def edit
    @lecture = Lecture.find(params[:id])
  end
  def update
    lecture = Lecture.find(params[:id])
    lecture.update_attributes(params[:lecture])
    redirect_to(lectures_path)
  end
  def destroy
    lecture = Lecture.find(params[:id])

    lecture.rosters.each { | thisroster |
      thisroster.destroy
    }
    lecture.delete
    redirect_to(lectures_path)
  end

  def statusbuttonmap
        @statusbutton_map = { "not_getting_button" => 1, "on_track_button" => 2, "got_it_button" => 3 }
  end

  def statusmap 
         @status_map = { "not_getting" => 1, "on_track" => 2, "got_it" => 3 }
  end

  def updatestatus
     
       current_user.currentstatus = statusbuttonmap[params[:notice]]
       current_user.save

  end

  

 
end


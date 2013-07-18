class LecturesController < ApplicationController
  def index
    @lectures = Lecture.all
    current_user.rosters.each { | i |
    i.destroy
    }

  end
  def new
    @lecture = Lecture.new
    # @roster = Roster.new(@lecture)
  end
  def create
    lecture = Lecture.create(params[:lecture])
    redirect_to(lecture)
  end
  def show
    @lecture = Lecture.find(params[:id])
    roster = Roster.find_or_create_by_user_id_and_lecture_id(user_id: current_user.id, lecture_id: @lecture.id)



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
    redirect_to(lecture)
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
     
       current_user.status = statusbuttonmap[params[:notice]]
      # a.status = params[:notice]
      # flash.now[:notice] = "Updated Status"

      respond_to do |format|
      format.html
     # format.json  { render :json => @user}
      end

  end

  def dashboard
     @lecture = Lecture.last
  end

  def graphprep
     vis = Rubyvis::Panel.new do 
        width 150
        height 150
        bar do
          data [1, 1.2, 1.7, 1.5, 0.7, 0.3]
          width 20
          height {|d| d * 80}
          bottom(0)
          left {index * 25}
          vis.render()
          vis.to_svg # Output final SVG
        end
      end
    end
end


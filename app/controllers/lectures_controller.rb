class LecturesController < ApplicationController
  def index
    @lectures = Lecture.all
  end
  def new
    @lecture = Lecture.new
  end
  def create
    lecture = Lecture.create(params[:lecture])
    redirect_to(lecture)
  end
  def show
    @lecture = Lecture.find(params[:id])
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
    lecture.delete
    redirect_to(lectures_path)
  end

  def statusmap
        @status_map = { "not_getting_button" => 1, "on_track_button" => 2, "got_it_button" => 3 }
  end

  def updatestatus
     
       current_user.status = statusmap[params[:notice]]
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
end

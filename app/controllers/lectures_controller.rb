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
  def dashboard

  end
end

class InstructorsController < ApplicationController
 def index
	    @instructors = Instructor.all
	 end
	 def new
	    @instructor = Instructor.new
	    @currentinstructor = @instructor
	 end
	 def create
	    instructor = Instructor.create(params[:instructor])
	    @currentinstructor = @instructor
	    redirect_to(instructor)

	 end
	 def show
	    @currentinstructor
	 end
	 def edit
	    @instructor = Instructor.find(params[:id])
	 end
	 def update
	    instructor = Instructor.find(params[:id])
	    instructor.update_attributes(params[:instructor])
	    redirect_to(instructor)
	 end
	 def destroy
	    instructor = Instructor.find(params[:id])
	    instructor.delete
	    redirect_to(instructors_path)
	 end

end

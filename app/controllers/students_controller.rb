class StudentsController < ApplicationController
	 def index
	    @students = Student.all
	 end
	 def new
	    @student = Student.new
	    @currentstudent = @student
	 end
	 def create
	    student = Student.create(params[:student])
	    @currentstudent = @student
	    redirect_to(student)

	 end
	 def show
	    @currentstudent
	 end
	 def edit
	    @student = Student.find(params[:id])
	 end
	 def update
	    student = Student.find(params[:id])
	    student.update_attributes(params[:student])
	    redirect_to(student)
	 end
	 def destroy
	    student = Student.find(params[:id])
	    student.delete
	    redirect_to(students_path)
	 end

	def setstatus
	
		if params[:got_it_button] {

		}

	end

end

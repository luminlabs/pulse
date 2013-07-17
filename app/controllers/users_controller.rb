class UsersController < ApplicationController
	 def index
	    @users = User.all
	 end
	 def new
	    @user = User.new
	    @currentuser = @user
	 end
	 def create
	    user = User.create(params[:user])
	    @currentuser = @user
	    redirect_to(user)

	 end
	 def show
	    @currentuser
	 end
	 def edit
	    @user = User.find(params[:id])
	 end
	 def update
	    user = User.find(params[:id])
	    user.update_attributes(params[:user])
	    redirect_to(user)
	 end
	 def destroy
	    user = User.find(params[:id])
	    user.delete
	    redirect_to(users_path)
	 end

	def setstatus
	
		# if params[:got_it_button] {

		# }

	end

end
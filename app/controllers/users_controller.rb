class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		#@user = User.new(params[:user]) # not the final implementation!  Allows mass assignment attacks.
		@user = User.new(user_params) # defined below
		if @user.save
			sign_in @user # in sessions_helper
			flash[:success] = "Welcome to the Sample App!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end

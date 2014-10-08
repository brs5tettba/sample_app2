class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:password])
			# Sign in user and redirect to user's show page
			sign_in user # created by me in sessions_helper
			redirect_to user
		else
		# Create error message and re-render signin form

		# flash.now is for rendered pages, which aren't recognized
		# as the "one-time view" desired in regular flashes.
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out # created by me in sessions_helper
		redirect_to root_url
	end

end

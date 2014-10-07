module SessionsHelper

	def sign_in(user)
		# Create a token
		remember_token = User.new_remember_token
		# Place the raw token in user's cookies
		# Built-in synonym for cookies[:remember_token] = { value: remember_token,
		#                                         expires: 20.years.from_now.utc }
		cookies.permanent[:remember_token] = remember_token
		# save hashed token to database
		user.update_attribute(:remember_token, User.digest(remember_token))
		# update current user
		self.current_user = user # use setter below
	end

	def signed_in?
		!current_user.nil? # use getter below
	end

	# Setter.  Allows self.current_user=____ above
	def current_user=(user)
		@current_user = user
	end

	# Getter
	def current_user
		remember_token = User.digest(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def sign_out
		current_user.update_attribute(:remember_token,
												User.digest(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end
end

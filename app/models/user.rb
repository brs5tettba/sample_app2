class User < ActiveRecord::Base
	# This is a Rails built-in that does a LOT
	# For now, we're using the virtual fields it provides,
	# :password and :password_confirmation, and authenticate()
	has_secure_password
	# Just add two small things to has_secure_password...
	# Requires one lower case letter, one upper case letter, one digit, 7-20 length, and no spaces or single quotes
	# OR a letter of any case, a digit, a symbol, 7-20 length, and no spaces or single-quotes
	VALID_PASSWORD_REGEX = /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*[\s']).{7,20}|(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#\$%^&*(){}\\\/+=_-`~])(?!.*[\s']).{7,20}\z/
	validates :password, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }

   validates :name, presence: true, length: { maximum: 50 }
   VALID_EMAIL_REGEX = /\A[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}\z/i
   validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
   						uniqueness: { case_sensitive: false }

   before_save { self.email = email.downcase }
end

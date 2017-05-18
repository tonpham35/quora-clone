class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	has_secure_password

	validates :email, :password_digest, presence: {message: "Please fill-in all fields" }
	validates :email, uniqueness: true # { message: "must be new"}
	validates :email, format: { with: /\w*@.*\.\w*/,
		message: "Invalid email address" } 
	validates :password_digest, length: { minimum: 6,
		message: "Password must be at least 6 characters" }
end

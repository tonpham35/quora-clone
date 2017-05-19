class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

	has_secure_password
	has_many :questions
	has_many :answers

	validates :email, :password_digest, :full_name, presence: {message: "Please fill-in all fields" }
	validates :email, uniqueness: { message: "must be new"}
	validates :email, format: { with: /\w*@.*\.\w*/, message: "Invalid email address" } 
	validates :password_digest, length: { minimum: 6, message: "Password must be at least 6 characters" }
end

class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	has_many :answers

	def answer_count
		self.answers.count
	end

	def owner_full_name
		self.user.full_name
	end

end

post '/answers/:id/delete' do
	@answer = Answer.find(params[:id])
	# @answers = @question.answers.all 
	x = @answer.user.id
	# @answers.destroy_all
	@answer.destroy
	redirect "users/#{x}"
end
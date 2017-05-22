post '/questions' do
	@questions = current_user.questions.new(question: params[:question])
	@questions.save
	redirect '/'
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	@answer = Answer.where(question: params[:id])
  	erb :"questions/show"
end

post '/questions/:id/answer' do
	@answers = current_user.answers.new(question_id: params[:question_id], answer: params[:response])
	@answers.save
	redirect "questions/#{params[:question_id]}"  
end

post '/questions/:id/delete' do
	@question = Question.find(params[:id])
	# @answers = @question.answers.all 
	x = @question.user.id
	# @answers.destroy_all
	@question.destroy
	redirect "users/#{x}"
end
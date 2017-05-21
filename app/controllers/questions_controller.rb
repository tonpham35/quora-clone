post '/questions' do
	@questions = Question.create(user_id: session[:id], question: params[:question])
	redirect '/'
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	@answer = Answer.where(question: params[:id])
  	erb :"questions/show"
end

post '/questions/:id/answer' do
	# user_id = params[:users_id]
	# user_id = user_id.to_i
	# question_id = params[:question_id]
	# question_id = question_id.to_i
	@answers = Answer.new(question_id: params[:question_id], answer: params[:response], user_id: session[:id])
	@answers.save
	redirect '/'  
end
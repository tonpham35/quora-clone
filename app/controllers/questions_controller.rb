post '/questions' do
	@questions = current_user.questions.new(question: params[:question])
	@questions.save
	@questions.to_json(methods: [:answer_count], include: :user)
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
	x = @question.user.id
	@question.destroy
	redirect "users/#{x}"
end

post '/questions/:id/vote' do
	@questionvote = current_user.questionvotes.new(user_id: session[:id], question_id: params[:id]) 
	@questionvote.save
	redirect '/'
end
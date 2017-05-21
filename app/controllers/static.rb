get '/' do
	@question = Question.all
	@user = User.all
	erb :"static/index"
end

post '/questions' do
  @questions = Question.new(user_id: session[:id], question: params[:question])
end

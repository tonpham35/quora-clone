post '/question' do
  @questions = Question.create(user_id: session[:id], question: params[:question])
  redirect '/'
end
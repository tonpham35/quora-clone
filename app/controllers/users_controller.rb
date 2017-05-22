

# CREATE- new
get '/signup' do
	erb :"users/new"
end


#CREATE - create
post '/signup' do
  @user = User.new(full_name: params[:full_name], email: params[:email], password: params[:password_digest])
  if @user.save
  	session[:full_name] = @user.full_name
  	session[:email] = @user.email
  	session[:id] = @user.id
    redirect '/'
  else
  	@message = 'Invalid - Log-in already exist and/or invalid password'
  end
end 

post '/users/:id/delete' do
  @user = User.find(params[:id])
  if session[:id].to_s == params[:id]
    # @question = Question.where(id: params[:id])
    # @answers = @question.answers
    # @answers.destroy
    # @question.destroy
    # @answers = Answer.where(user: session[:id])
    # @answers.destroy
    # @user = User.find(params[:id])
    @user.destroy
    session[:id] = nil  
  end
  redirect '/'
end


#CREATE - new
get '/login' do
	if session[:id] != nil
		@message = "Already logged in, please log off first"
	else
		erb :"sessions/login"
	end
end

#DELETE - destroy

get '/logout' do
	session[:id] = nil	
	redirect '/'
end

 
#CREATE	 - create
post '/login' do
	@user = User.find_by(email: params[:email])
	session.clear
	if @user && @user.authenticate(params[:password_digest])
  		session[:email] = @user.email
  		session[:full_name] = @user.full_name
  		session[:id] = @user.id
    	redirect '/'
	else
		@message = 'Invalid Log-in. Check email and password'
	end
end  

get '/users/:id' do
	@user = User.find(params[:id])
	@question = Question.where(user: @user.id)
	@answer = Answer.where(user: @user.id)
  	erb :"users/show"
end
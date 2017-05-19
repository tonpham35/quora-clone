#CREATE - new
get '/login' do
	if session[:user] != nil
		@message = "Already logged in, please log off first"
	else
		erb :"sessions/login"
	end
end

#DELETE - destroy

get '/logout' do
	session[:user] = nil	
	redirect '/'
end

 
#CREATE	 - create
post '/login' do
	@user = User.find_by(email: params[:email])
	session.clear
	if @user.authenticate(params[:password_digest])
  		session[:user] = @user.id
  		session[:email] = @user.email
  		session[:full_name] = @user.full_name
    	redirect '/'
	else
		@message = 'Invalid Log-in. Check email and password'
	end
end  

get '/users/:id' do
	@user = User.find(params[:id])
  	erb :"users/show"
end
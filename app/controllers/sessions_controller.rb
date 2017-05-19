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
	u = User.find_by(email: params[:email])
	if u.authenticate(params[:password_digest])
  		session[:user] = u.id
    	redirect '/'
	else
		@message = 'Invalid Log-in. Check email and password'
	end
end  
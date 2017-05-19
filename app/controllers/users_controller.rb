

# CREATE- new
get '/signup' do
	erb :"users/new"
end


#CREATE - create
post '/signup' do
  @user = User.new(full_name: params[:full_name], email: params[:email], password: params[:password_digest])
  if @user.save
  	session[:user] = @user.id
  	session[:full_name] = @user.full_name
  	session[:email] = @user.email
  	session[:id] = @user.id
    redirect '/'
  else
  	@message = 'Invalid - Log-in already exist and/or invalid password'
  end
end 

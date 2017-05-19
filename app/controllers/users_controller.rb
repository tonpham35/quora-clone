

# CREATE- new
get '/signup' do
	erb :"users/new"
end


#CREATE - create
post '/signup' do
  user = User.new(email: params[:email], password: params[:password_digest])
  # byebug
  if user.save
  	session["user"] = params[:email]
    redirect '/'
  else
  	@message = 'Invalid - Log-in already exist and/or invalid password'
  end
end 
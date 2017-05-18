enable :sessions

get '/' do
	erb :"static/index"
end

get '/signup' do
	erb :"static/signup"
end

get '/login' do
	erb :"static/login"
end

post '/signup' do
  user = User.new(email: params[:email], password: params[:password_digest])
  # byebug
  if user.save
    erb :"static/index"
  else
	erb :"static/signup"
  end
end  

post '/login' do

	u = User.find_by(email: params[:email])
  # u = User.find_by(email: params[:email])
  # byebug
  if u.authenticate(params[:password_digest])
    	erb :"static/index"
  else
		erb :"static/login"
  end
end  
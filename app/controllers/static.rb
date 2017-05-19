get '/' do
	session[:user]
	erb :"static/index"
end

get '/index2' do
	session[:user]
	erb :"static/index2"
end

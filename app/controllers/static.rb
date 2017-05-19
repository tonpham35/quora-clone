get '/' do
	session[:user]
	erb :"static/index"
end


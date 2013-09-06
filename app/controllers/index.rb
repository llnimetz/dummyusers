get '/' do
  if session[:user_id]
  	erb :secret
  else
	  # Look in app/views/index.erb
	 erb :index
  end
end


post '/signin' do
  	user = User.new(name: params[:name], email: params[:email], password_hash: params[:password])  	  
  	if user.save
  	  session[:user_id] = user.id
  	  erb :secret
	else
	  @errors if user.errors.any?  
	  redirect "/"
	end
end


post '/login' do
   user = User.find_by_email(params[:email])
   if user.nil?
   	 @failed_login_message = "login error. try again."
     redirect "/"	 
   else
   	 if user.password_hash == params[:password]
	   session[:user_id] = user.id
       erb :secret
     else
       @failed_login_message
       redirect "/"
     end
   end
end


get '/logout' do
	session[:user_id] = false
	erb :index
end

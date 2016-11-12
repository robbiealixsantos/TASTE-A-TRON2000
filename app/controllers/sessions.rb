get '/sessions/login' do
  if request.xhr?
    erb :'sessions/_login', layout: false
  else
    erb :'sessions/_login'
  end
end

post '/sessions' do
  @user = User.authenticate(params[:user])
  if @user
    session[:id] = @user.id
    redirect '/hello'
  else
    @error = "User email and/or password not valid!"
    erb :'sessions/_login'
  end
end

delete '/sessions' do
  session[:id] = nil
  redirect '/'
end
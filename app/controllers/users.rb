get '/users/new' do
  if request.xhr?
    erb :'users/_new', layout: false
  else
    erb :'users/_new'
  end
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/hello'
  else
    @errors = @user.errors.full_messages
    erb :'users/_new'
  end
end

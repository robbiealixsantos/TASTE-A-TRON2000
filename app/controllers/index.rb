get '/' do
  redirect '/hello'
end

post '/index' do
  @giphy = add_giphy(food_matcher)
  if request.xhr?
    @weather.to_s
    @giphy.to_s
  else
    erb :index
  end
end

get '/hello' do
  @weather = get_weather
  erb :'index'
end


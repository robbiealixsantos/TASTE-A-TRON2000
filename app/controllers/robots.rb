get '/robots' do
  erb :'robots/index'
end

post '/robots' do
  @food = params[:food]
  @result = food_matcher(@food)
    if @result["result"] == "Can choose someone better."
      @reply = "One Word: Bubbleguts"
      erb :'robots/index', layout: false
    else
      @reply = @result["result"]
      erb :'robots/index'
    end
end


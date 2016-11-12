require 'httparty'

helpers do

  def get_weather
    mykey = ENV['WEATHER_API_KEY']
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=sanfrancisco,ca&appid=#{mykey}")
    return (response["main"]["temp"] / 4.2).round(2)
  end

  def recipe_generator
    mykey = ENV['WEATHER_API_KEY']
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=sanfrancisco,ca&appid=#{mykey}")
    current_temp = (response["main"]["temp"] / 4.2).round(2)
    if response.code == 200
      if current_temp > 80
      hot_max = ["stay hydrated", "ceviche", "fruit salad"]
      return hot_max.sample
    elsif current_temp > 75
      kind_of_hot = ["salad", "ceviche", "french fries", "sandwich", "4 tacos", "pad thai", "hot dogs", "sushi", "burgers", "sausages", "sorbet", "hummus with pita bread", "baked salmon", "burrito", "a burger wrap", "spicy tuna roll","pho"]
      return kind_of_hot.sample
    elsif current_temp > 70
      room_temperature = ["salad", "ceviche", "french fries", "sandwich", "4 tacos", "pad thai", "hot dogs", "sushi", "burgers", "sausages", "sorbet", "hummus with pita bread", "baked salmon", "burrito", "a burger wrap", "spicy tuna roll", "pho"]
      return room_temperature.sample
    elsif current_temp > 68
      sf_weather = ["salad", "ceviche", "french fries", "sandwich", "4 tacos", "pad thai", "hot dogs", "sushi", "burgers", "sausages", "sorbet", "hummus with pita bread", "baked salmon", "burrito", "a burger wrap", "spicy tuna roll", "pho"]
      return sf_weather.sample
    elsif current_temp > 65
      colder_weather = ["salad", "ceviche", "french fries", "sandwich", "4 tacos", "pad thai", "hot dogs", "sushi", "burgers", "sausages", "sorbet", "hummus with pita bread", "baked salmon", "burrito", "a burger wrap", "spicy tuna roll", "pho"]
      return colder_weather.sample
    elsif current_temp > 60
      super_cold = ["porridge", "pho","sausages", "pad thai"]
      return super_cold.sample
    else
      kind_of_hot = ["salad", "ceviche", "french fries", "sandwich", "tacos"]
      return kind_of_hot.sample
    end
  end
end

  def add_giphy(user_query)
    response = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=#{user_query}?&api_key=dc6zaTOxFJmzC")
    return response["data"][rand(0..10)]["images"]["downsized"]["url"]
  end

  def food_matcher(food_choice)
    response = HTTParty.get("https://love-calculator.p.mashape.com/getPercentage?fname=#{food_choice}&sname=food",
    headers:{
      "X-Mashape-Key" => ENV["MASHAPE_KEY"],
      "Accept" => "application/json"
    })
    return response
  end

end
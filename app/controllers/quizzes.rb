get '/quizzes' do
  @food_result = ["salad", "ceviche", "french fries", "sandwich", "4 tacos", "pad thai", "hot dogs", "sushi", "burgers", "sausages", "sorbet", "hummus with pita bread", "baked salmon", "burrito", "a burger wrap", "spicy tuna roll"]
  erb :'quizzes/index'
end
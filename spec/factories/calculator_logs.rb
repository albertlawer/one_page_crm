FactoryBot.define do
  OprandArray = ["+","-","*","/"]
  factory :calculator_log do
    operation { "#{Faker::Number.between(from: 1, to: 100)}#{OprandArray[rand(OprandArray.length)]}#{Faker::Number.between(from: 1, to: 100)}"  }
    results { 1 }
  end
end
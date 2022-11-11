FactoryBot.define do
  OprandArray = ["+","-","*","/"]
  factory :calculator_log do
    operation { "#{Faker::Number.between(from: 0, to: 99)}#{OprandArray[rand(OprandArray.length)]}#{Faker::Number.between(from: 0, to: 99)}"  }
    results { 1 }
  end
end
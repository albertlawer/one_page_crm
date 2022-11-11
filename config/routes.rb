Rails.application.routes.draw do
  post "calculate" => "calculates#calculate", as: :calculate
  root 'calculates#index'
end

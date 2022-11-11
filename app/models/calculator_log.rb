class CalculatorLog
  include Mongoid::Document
  include Mongoid::Timestamps
  field :operation, type: String
  field :results, type: Integer
  
  validates :operation, presence: true
  validates :results, presence: true
end

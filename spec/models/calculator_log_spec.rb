require 'rails_helper'

RSpec.describe CalculatorLog, type: :model do
  
  describe "validations" do
    let(:cal_instance){ build :calculator_log}
    let(:_cal){ CalculatorLog.new}

    it "should validate factory" do
      expect(cal_instance).to be_valid
    end

    it "should validate attributes" do
      expect(_cal).not_to be_valid
    end
  end
end

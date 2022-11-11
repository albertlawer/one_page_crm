require 'rails_helper'

OprandArray = ["+","-","*","/"]

RSpec.describe "Calculates", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Post calculate' do
    let(:valid_params){
      {"field_one"=>Faker::Number.between(from: 0, to: 99), "field_two"=>Faker::Number.between(from: 0, to: 99), "operand"=>OprandArray[rand(OprandArray.length)]}
    }

    let(:invalid_params){
      {"field_one"=>Faker::Number.between(from: 0, to: 99), "field_two"=>0, "operand"=>"/"}
    }

    it "returns http success" do
      post "/calculate", params: valid_params, as: :json
      expect(response).to have_http_status(:ok)
    end

    it "should return json" do
      post "/calculate", params: valid_params, as: :json
      expect(response.content_type).to match(a_string_including("application/json"))
    end

    
    it "returns success code" do
      post "/calculate", params: valid_params, as: :json
      body = JSON.parse(response.body)
      theCode = body["ErrorCode"]
      expect(theCode).to eq("200")
    end

    it "returns failure code" do
      post "/calculate", params: invalid_params, as: :json
      body = JSON.parse(response.body)
      theCode = body["ErrorCode"]
      expect(theCode).not_to eq("200")
    end
    
  end
end

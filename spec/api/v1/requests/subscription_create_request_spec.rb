require "rails_helper"

RSpec.describe "Subscription API" do
  before(:each) do
    test_data

    @valid_params = {
      "new_subscription": {
        "title": "Some stuff a LOTR's character would drink.",
        "frequency": 5,
        "teas": {
          "#{@tea_1.id}": 2,
          "#{@tea_2.id}": 4,
          "#{@tea_3.id}": 6
        }
      }
    }

    @there_is_no_tea = {
      "new_subscription": {
        "title": "Some stuff a LOTR's character would NOT drink.",
        "frequency": 5,
        "teas": {}
      }
    }
  end

  describe "Happy Path" do
    it "response is successful" do
      post api_v1_customer_subscriptions_path(@customer_1.id), params: @valid_params

      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

   it "returns the data wanted" do
      post api_v1_customer_subscriptions_path(@customer_1.id), params: @valid_params

      expect(response).to be_successful
      expect(response).to have_http_status(200)
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:data][1]).to have_key(:id)
      expect(data[:data][1][:id]).to be_a String
      expect(data[:data][1]).to have_key(:type)
      expect(data[:data][1][:type]).to eq("subscriptions")
      expect(data[:data][1]).to have_key(:attributes)
      expect(data[:data][1][:attributes]).to be_a Hash

      expect(data[:data][1][:attributes]).to have_key(:customer_id)
      expect(data[:data][1][:attributes][:customer_id]).to be_a Integer
      expect(data[:data][1][:attributes]).to have_key(:title)
      expect(data[:data][1][:attributes][:title]).to be_a String
      expect(data[:data][1][:attributes]).to have_key(:status)
      expect(data[:data][1][:attributes][:status]).to eq(true)
      expect(data[:data][1][:attributes]).to have_key(:frequency)
      expect(data[:data][1][:attributes][:frequency]).to be_a Integer
      expect(data[:data][1][:attributes]).to have_key(:price)
      expect(data[:data][1][:attributes][:price]).to be_a Float
    end
  end

  describe "Sad Path" do
    it "returns an error if the customer does not exist" do
      post api_v1_customer_subscriptions_path(12345678910), params: @valid_params

      expect(response).to_not be_successful
      expect(response).to have_http_status(404)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to be_a Hash
      expect(error).to have_key(:errors)
      expect(error[:errors]).to eq("Customer does not exist.")
    end

    it "returns an error if the teas are empty" do
      post api_v1_customer_subscriptions_path(@customer_1.id), params: @there_is_no_tea

      expect(response).to_not be_successful
      expect(response).to have_http_status(422)
      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to be_a Hash
      expect(error).to have_key(:errors)
      expect(error[:errors]).to eq("Subscription cannot be empty.")
    end
  end
end
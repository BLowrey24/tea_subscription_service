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

    @no_title = {
      "new_subscription": {
        "frequency": 5,
        "teas": {
          "#{@tea_1.id}": 2,
          "#{@tea_2.id}": 4,
          "#{@tea_3.id}": 6
        }
      }
    }

    @bad_frequency = {
      "new_subscription": {
        "title": "Bad Frequency",
        "frequency": "not a number",
        "teas": {
          "#{@tea_1.id}": 2
        }
      }
    }

    @bad_status = {
      "new_subscription": {
        "title": "Bad Status",
        "frequency": "not a number",
        "status": "bad",
        "teas": {
          "#{@tea_1.id}": 2
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

      expect(data[:data]).to have_key(:id)
      expect(data[:data][:id]).to be_a String
      expect(data[:data]).to have_key(:type)
      expect(data[:data][:type]).to eq("subscriptions")
      expect(data[:data]).to have_key(:attributes)
      expect(data[:data][:attributes]).to be_a Hash

      expect(data[:data][:attributes]).to have_key(:customer_id)
      expect(data[:data][:attributes][:customer_id]).to be_a Integer
      expect(data[:data][:attributes]).to have_key(:title)
      expect(data[:data][:attributes][:title]).to be_a String
      expect(data[:data][:attributes]).to have_key(:status)
      expect(data[:data][:attributes][:status]).to eq(true)
      expect(data[:data][:attributes]).to have_key(:frequency)
      expect(data[:data][:attributes][:frequency]).to be_a Integer
      expect(data[:data][:attributes]).to have_key(:price)
      expect(data[:data][:attributes][:price]).to be_a Float
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

    it "invalid subscription creation due to missing title" do
      post api_v1_customer_subscriptions_path(@customer_1.id), params: @no_title

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to be_a Hash
      expect(error).to have_key(:errors)
      expect(error[:errors]).to include("Invalid subscription params.")
    end

    it "invalid subscription creation due to invalid status" do
      post api_v1_customer_subscriptions_path(@customer_1.id), params: @bad_status

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to be_a Hash
      expect(error).to have_key(:errors)
      expect(error[:errors]).to include("Invalid subscription params.")
    end

    it "invalid subscription creation when frequency isnt a number" do
      post api_v1_customer_subscriptions_path(@customer_1.id), params: @bad_frequency

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to be_a Hash
      expect(error).to have_key(:errors)
      expect(error[:errors]).to include("Invalid subscription params.")
    end
  end
end
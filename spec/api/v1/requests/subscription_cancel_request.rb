require "rails_helper"

RSpec.describe "Subscription API" do
  before(:each) do
    test_data
  end

  describe "Happy Path" do
    it "response is successful" do
      patch api_v1_customer_subscription_path(@customer_1.id, @subscription_1.id), params: {status: false}

      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it "changes the status correctly" do
      patch api_v1_customer_subscription_path(@customer_1.id, @subscription_11.id), params: {status: false}
      expect(response).to be_successful
      expect(response).to have_http_status(200)

      data = JSON.parse(response.body, symbolize_names: true)
      expect(@customer_1.subscriptions.where(status: false).count).to eq(2)

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
      expect(data[:data][:attributes][:status]).to eq(false)
      expect(data[:data][:attributes]).to have_key(:frequency)
      expect(data[:data][:attributes][:frequency]).to be_a Integer
      expect(data[:data][:attributes]).to have_key(:price)
      expect(data[:data][:attributes][:price]).to be_a Integer
    end
  end

  describe "Sad Path" do
    it "returns an error if there is no subscription" do
      patch api_v1_customer_subscription_path(@customer_1.id, 12345678910), params: {status: false}

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(404)
      expect(error[:errors]).to eq("Subscription not found.")
    end
  end
end
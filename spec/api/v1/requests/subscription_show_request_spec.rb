require 'rails_helper'

RSpec.describe "Subscription API" do
  before(:each) do
    test_data
  end

  describe "Happy Path" do
    it "response to be successful" do
      get api_v1_customer_subscriptions_path(@customer_1.id)

      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it "returns the data wanted" do
      get api_v1_customer_subscriptions_path(@customer_1)

      returned_data = JSON.parse(response.body, symbolize_names: true)
      expect(returned_data).to have_key(:data)
      expect(returned_data[:data].first[:type]).to eq("subscriptions")
      expect(returned_data[:data].size).to eq(3)
      expect(returned_data[:data].first[:id]).to eq(@subscription_1.id.to_s)

      attributes = returned_data[:data].first[:attributes]
      expect(attributes[:customer_id]).to eq(@customer_1.id)
      expect(attributes[:title]).to be_a(String)
      expect(attributes[:status]).to be(true).or(be(false))
      expect(attributes[:frequency]).to be_a(Integer)
      expect(attributes[:price]).to be_a(Float)
    end

    it "customer has no subscriptions" do
      get api_v1_customer_subscriptions_path(@customer_10)

      expect(response).to be_successful
      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:data]).to eq("This customer has no subscriptions.")
    end
  end

  describe "Sad Path" do
    it "there is no customer" do
      get api_v1_customer_subscriptions_path(12345678910)

      expect(response).not_to be_successful
      expect(response).to have_http_status(404)

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:errors]).to eq("Could not find a customer with that ID.")
    end
  end
end
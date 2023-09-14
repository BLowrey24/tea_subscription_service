require "rails_helper"

RSpec.describe "Subscription API" do
  before(:each) do
    test_data
  end

  describe "Happy Path" do
    it "response is successful" do
      patch api_v1_customer_subscription_path(@customer_1.id, @subscription_1.id), params: {status: false}

      expect(response).to be_successful
      expect(response).to have_http_status(204)
    end

    it "changes the status correctly" do
      patch api_v1_customer_subscription_path(@customer_1.id, @subscription_11.id), params: {status: false}
      expect(response).to be_successful
      expect(response).to have_http_status(204)

      expect(@customer_1.subscriptions.where(status: false).count).to eq(1)
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
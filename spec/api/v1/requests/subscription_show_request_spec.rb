require 'rails_helper'

RSpec.describe "Subscription API" do
  before(:each) do
    test_data
  end

  describe "index" do
    it "response to be successful" do
      get api_v1_customer_subscriptions_path(@customer_5.id)

      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end
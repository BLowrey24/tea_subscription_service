require 'rails_helper'

describe "Subscription API" do
  it "allows a customer to subscribe to a tea subscription" do
    get "/api/v1/subscriptions"

    expect(response).to be_successful
  end
end
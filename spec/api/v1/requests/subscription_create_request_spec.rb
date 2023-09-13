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
  end

  describe "Happy Path" do
    it "response is successful" do
      post api_v1_customer_subscriptions_path(@customer_1.id), params: @valid_params

      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

   xit "returns the data wanted" do
      post api_v1_customer_subscriptions_path(@customer_1.id), params: @valid_params

      expect(response).to be_successful
      expect(response).to have_http_status(200)
      data = JSON.parse(response.body, symbolize_names: true)
      # require 'pry'; binding.pry

      expect(data)
    end
  end
end
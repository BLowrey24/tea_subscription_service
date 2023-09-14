class Api::V1::CustomerSubscriptionsController < ApplicationController
  def update
    subscription = Subscription.find_by_id(subscription_params[:id])
    # require 'pry'; binding.pry
    if subscription
      subscription.update(subscription_params)
      render json: SubscriptionsSerializer.new(subscription), status: 204
    else
      render json: {errors: "Subscription not found."}, status: 404
    end
  end
end

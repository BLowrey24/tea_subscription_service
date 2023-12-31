class SubscriptionFacade
  def self.new_subscription(id, sub)
    subscription = Subscription.new(customer_id: id, title: sub[:title], status: true, frequency: sub[:frequency])
    if subscription.save
      sub[:teas].each do |tea, quan|
        sub_tea = SubscriptionTea.new(subscription_id: subscription.id, tea_id: tea, quantity: quan)
        if sub_tea.save
          next
        end
      end
    else
      return false
    end
    true
  end
end
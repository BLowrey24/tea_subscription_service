
tea_1 = Tea.create!(title: "Green Tea", description: "Fresh flavor", temperature: 90.1, brew_time: 121, price: 1.00)
tea_2 = Tea.create!(title: "Black Tea", description: "Bold taste", temperature: 92.2, brew_time: 122, price: 2.00)
tea_3 = Tea.create!(title: "Herbal Tea", description: "Relaxing blend", temperature: 93.3, brew_time: 123, price: 3.00)
tea_4 = Tea.create!(title: "Chai Tea", description: "Spicy kick", temperature: 94.4, brew_time: 124, price: 4.00)
tea_5 = Tea.create!(title: "Oolong Tea", description: "Rich aroma", temperature: 95.5, brew_time: 125, price: 5.00)
tea_6 = Tea.create!(title: "White Tea", description: "Delicate taste", temperature: 96.6, brew_time: 126, price: 6.00)
tea_7 = Tea.create!(title: "Earl Grey", description: "Citrus twist", temperature: 97.7, brew_time: 127, price: 7.00)
tea_8 = Tea.create!(title: "Rooibos Tea", description: "Caffeine-free", temperature: 98.8, brew_time: 128, price: 8.00)
tea_9 = Tea.create!(title: "Jasmine Tea", description: "Floral notes", temperature: 99.9, brew_time: 129, price: 9.00)
tea_10 = Tea.create!(title: "Chamomile Tea", description: "Soothing blend", temperature: 100.0, brew_time: 1210, price: 10.00)


customer_1 = Customer.create!(first_name: "Aragorn", last_name: "Elessar", email: "Customer@1.com")
customer_2 = Customer.create!(first_name: "Frodo", last_name: "Baggins", email: "Customer@2.com")
customer_3 = Customer.create!(first_name: "Gandalf", last_name: "Grey", email: "Customer@3.com")
customer_4 = Customer.create!(first_name: "Legolas", last_name: "Greenleaf", email: "Customer@4.com")
customer_5 = Customer.create!(first_name: "Gollum", last_name: "Sméagol", email: "Customer@5.com")
customer_6 = Customer.create!(first_name: "Samwise", last_name: "Gamgee", email: "Customer@6.com")
customer_7 = Customer.create!(first_name: "Boromir", last_name: "Son of Denethor", email: "Customer@7.com")
customer_8 = Customer.create!(first_name: "Éowyn", last_name: "White Lady of Rohan", email: "Customer@8.com")
customer_9 = Customer.create!(first_name: "Faramir", last_name: "Son of Denethor", email: "Customer@9.com")
customer_10 = Customer.create!(first_name: "Pippin", last_name: "Took", email: "Customer@10.com")


subscription_1 = Subscription.create!(customer_id: customer_1.id, title: "Tea Time with One", status: true, frequency: 1)
subscription_2 = Subscription.create!(customer_id: customer_1.id, title: "Mom's Tea Surprise", status: false, frequency: 2)
subscription_3 = Subscription.create!(customer_id: customer_2.id, title: "Frodo's Sip Adventure", status: true, frequency: 3)
subscription_4 = Subscription.create!(customer_id: customer_3.id, title: "Three's Tea Extravaganza", status: false, frequency: 4)
subscription_5 = Subscription.create!(customer_id: customer_3.id, title: "Monthly Tea Quest", status: true, frequency: 5)
subscription_6 = Subscription.create!(customer_id: customer_3.id, title: "In-Law Tea Time", status: true, frequency: 6)
subscription_7 = Subscription.create!(customer_id: customer_4.id, title: "Four's Tea Odyssey", status: true, frequency: 7)
subscription_8 = Subscription.create!(customer_id: customer_5.id, title: "Five's Tea Fiesta", status: true, frequency: 8)
subscription_9 = Subscription.create!(customer_id: customer_5.id, title: "Tea for Tiny Tots", status: false, frequency: 9)
subscription_10 = Subscription.create!(customer_id: customer_5.id, title: "Five's Extraordinary Collection", status: true, frequency: 10)
subscription_11 = Subscription.create!(customer_id: customer_1.id, title: "Blah", status: true, frequency: 2)

subscription_tea_1 = SubscriptionTea.create!(subscription_id: subscription_1.id, tea_id: tea_1.id, quantity: 1)
subscription_tea_2 = SubscriptionTea.create!(subscription_id: subscription_1.id, tea_id: tea_2.id, quantity: 2)

subscription_tea_3 = SubscriptionTea.create!(subscription_id: subscription_2.id, tea_id: tea_1.id, quantity: 1)
subscription_tea_4 = SubscriptionTea.create!(subscription_id: subscription_2.id, tea_id: tea_2.id, quantity: 2)
subscription_tea_5 = SubscriptionTea.create!(subscription_id: subscription_2.id, tea_id: tea_3.id, quantity: 3)

subscription_tea_6 = SubscriptionTea.create!(subscription_id: subscription_3.id, tea_id: tea_2.id, quantity: 2)
subscription_tea_7 = SubscriptionTea.create!(subscription_id: subscription_3.id, tea_id: tea_3.id, quantity: 3)

subscription_tea_8 = SubscriptionTea.create!(subscription_id: subscription_4.id, tea_id: tea_3.id, quantity: 3)
subscription_tea_9 = SubscriptionTea.create!(subscription_id: subscription_4.id, tea_id: tea_4.id, quantity: 4)

subscription_tea_10 = SubscriptionTea.create!(subscription_id: subscription_4.id, tea_id: tea_3.id, quantity: 3)
subscription_tea_11 = SubscriptionTea.create!(subscription_id: subscription_4.id, tea_id: tea_4.id, quantity: 4)
subscription_tea_12 = SubscriptionTea.create!(subscription_id: subscription_4.id, tea_id: tea_5.id, quantity: 5)

subscription_tea_13 = SubscriptionTea.create!(subscription_id: subscription_5.id, tea_id: tea_3.id, quantity: 3)
subscription_tea_14 = SubscriptionTea.create!(subscription_id: subscription_5.id, tea_id: tea_4.id, quantity: 4)
subscription_tea_15 = SubscriptionTea.create!(subscription_id: subscription_5.id, tea_id: tea_5.id, quantity: 5)
subscription_tea_16 = SubscriptionTea.create!(subscription_id: subscription_5.id, tea_id: tea_6.id, quantity: 6)

subscription_tea_17 = SubscriptionTea.create!(subscription_id: subscription_6.id, tea_id: tea_4.id, quantity: 4)
subscription_tea_18 = SubscriptionTea.create!(subscription_id: subscription_6.id, tea_id: tea_5.id, quantity: 5)

subscription_tea_19 = SubscriptionTea.create!(subscription_id: subscription_7.id, tea_id: tea_5.id, quantity: 5)
subscription_tea_20 = SubscriptionTea.create!(subscription_id: subscription_7.id, tea_id: tea_6.id, quantity: 6)

subscription_tea_21 = SubscriptionTea.create!(subscription_id: subscription_8.id, tea_id: tea_5.id, quantity: 5)
subscription_tea_22 = SubscriptionTea.create!(subscription_id: subscription_8.id, tea_id: tea_6.id, quantity: 6)
subscription_tea_23 = SubscriptionTea.create!(subscription_id: subscription_8.id, tea_id: tea_7.id, quantity: 7)

subscription_tea_24 = SubscriptionTea.create!(subscription_id: subscription_9.id, tea_id: tea_5.id, quantity: 5)
subscription_tea_25 = SubscriptionTea.create!(subscription_id: subscription_9.id, tea_id: tea_6.id, quantity: 6)
subscription_tea_26 = SubscriptionTea.create!(subscription_id: subscription_9.id, tea_id: tea_7.id, quantity: 7)
subscription_tea_27 = SubscriptionTea.create!(subscription_id: subscription_9.id, tea_id: tea_8.id, quantity: 8)

subscription_tea_28 = SubscriptionTea.create!(subscription_id: subscription_10.id, tea_id: tea_6.id, quantity: 6)
subscription_tea_29 = SubscriptionTea.create!(subscription_id: subscription_10.id, tea_id: tea_7.id, quantity: 7)

<h1> Tea Subscription Service </h1>

A simpile tea subscription back end API with three endpoints:

1. An endpoint to subscribe a customer to a tea subscription
2. An endpoint to cancel a customer's tea subscription
3. An endpoint to see all of a customer's subscriptions (active and cancelled)

<br>

# Tech
<ul>
  <li>Ruby 3.2.2</li>
  <li>Rails 7.0.8</li>
  <li>RSpec</li>
  <li>simplecov</li>
  <li>Pry</li>
  <li>jsonapi-serializer</li>
</ul>

<br><br>

# JSON Contracts

### Fetch One User's Subscriptions
<p> GET '/api/v1/customers/:customer_id/subscriptions' </p>
<p> Getting all of a user's subscriptions </p>

```
{
    "data": [
        {
            "id": "1",
            "type": "subscriptions",
            "attributes": {
                "customer_id": 1,
                "title": "Tea Time with One",
                "status": true,
                "frequency": 1,
                "price": 5.0
            }
        },
        {
            "id": "2",
            "type": "subscriptions",
            "attributes": {
                "customer_id": 1,
                "title": "Mom's Tea Surprise",
                "status": false,
                "frequency": 2,
                "price": 14.0
            }
        },
        {
            "id": "11",
            "type": "subscriptions",
            "attributes": {
                "customer_id": 1,
                "title": "Blah",
                "status": true,
                "frequency": 2,
                "price": 0
            }
        }
    ]
}
```


### Subscribe to One Subsciprion
<p> POST '/api/v1/customers/10/subscriptions’ </p>
<p> Example of the body details to be provided when subscribing to a subscription </p>

```
{
    "new_subscription": {
        "title": "Some stuff a Star Wars character would drink.",
        "frequency": 5,
        "teas": {
            "1": 2,
            "2": 4,
            "3": 6
        }
    }
}
```

## Response:

```
{
    "data": [
        {
            "id": "12",
            "type": "subscriptions",
            "attributes": {
                "customer_id": 10,
                "title": "Some stuff a Star Wars character would drink.",
                "status": true,
                "frequency": 5,
                "price": 28.0
            }
        }
    ]
}
```

### Cancel One Subscription
<p> Patch '/api/v1/customers/:customer_id/subscriptions/:id’ </p>
<p> Example of the body details that must be provided when canceling a subscription </p>

```
{
  "status": false
}
```

## Response:
```
{
    "data": {
        "id": "12",
        "type": "subscriptions",
        "attributes": {
            "customer_id": 1,
            "title": "Some stuff a Star Wars character would drink.",
            "status": false,
            "frequency": 5,
            "price": 28.0
        }
    }
}
```

<br>

# Schema

<img alt="this app's database schema" src="https://snipboard.io/yKCTuU.jpg">
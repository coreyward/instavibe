Instavibe API Reference & Documentation
=======================================

General Description
-------------------

+ REST API
+ Responses are JSON by default, XML available. To specify, append `.xml` to the URI
+ Successful requests return 200-299 HTTP Status Codes
+ Unsuccessful requests return 400-599 HTTP Status Codes with errors in the body 

Authorization
-------------

There is no authorization to use the API. This will change.

Endpoints
---------

The service revolves around N concepts:

1. `Users` create `plans` to attend `events`.
2. Other `users` also `plan` to attend the same `event`.
3. When a `user` arrives at an `event` they `checkin`, which fulfills their `plan`.

The following endpoints are available to work with this flow:

### Create a new user

    POST /users
    
    # body
    user[name] = 'Name'
    user[email] = 'email@example.com'

### Update a user

    PUT /users/:id
    
    # body
    user[name] = 'Updated Name'
    user[email] = 'updated.email@example.com'
    
### Get plans for a user

    GET /users/:user_id/plans
    
    # example response
    [
      {
        "plan": {
          "active": true,
          "checked_in_at": "2011-06-16T17:06:17Z",
          "created_at": "2011-06-14T16:04:22Z",
          "estimated_arrival_at": "2011-06-16T18:45:27Z",
          "event_id": 1,
          "id": 2,
          "message": null,
          "updated_at": "2011-06-16T17:06:17Z",
          "user_id": 1
        }
      },
      {
        "plan": {
          "active": true,
          "checked_in_at": null,
          "created_at": "2011-06-16T17:23:32Z",
          "estimated_arrival_at": "2011-06-16T18:45:50Z",
          "event_id": 2,
          "id": 7,
          "message": "Foobar!",
          "updated_at": "2011-06-16T17:23:32Z",
          "user_id": 1
        }
      }
    ]
    
### Get detailed information for a plan

    GET /users/:user_id/plans/:plan_id

    # example response
    {
      "plan": {
        "active": true,
        "checked_in_at": "2011-06-16T17:06:17Z",
        "created_at": "2011-06-14T16:04:22Z",
        "estimated_arrival_at": "2011-06-16T18:45:27Z",
        "event_id": 1,
        "id": 2,
        "message": null,
        "updated_at": "2011-06-16T17:06:17Z",
        "user_id": 1,
        "event": {
          "created_at": "2011-06-14T16:01:23Z",
          "creator_id": 1,
          "description": "Babes.",
          "id": 1,
          "spot_id": 1,
          "starts_at": "2011-06-14T19:01:23Z",
          "updated_at": "2011-06-14T16:01:23Z",
          "spot": {
            "created_at": "2011-06-14T15:58:12Z",
            "description": "The world’s leader in natural and organic foods, with more than 270 stores, Whole Foods Market began as a small neighborhood grocer 25 years ago.",
            "geolat": "30.2707337816",
            "geolong": "-97.7537029982",
            "id": 1,
            "image_url": "http://static.gowalla.com/spots/9241-4890f2589171e1d9f779714703969d98-100.png",
            "name": "Whole Foods",
            "updated_at": "2011-06-14T15:58:12Z",
            "url": "/spots/9241"
          }
        }
      }
    }

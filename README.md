# FastFoodBackend 🌭

This is the backend for https://github.com/AlanPieczonka/fast-food-frontend

It's written in Phoenix with addition of Absinthe to support GraphQL queries.

Heavily inspired by https://github.com/schneidmaster/socializer.

# Setup 🧳

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server`

# Supports JSON:API standard 🚀

You need to include these headers in _POST_ requests:

- `Content-Type: application/vnd.api+json`
- `Accept: application/vnd.api+json`

Example query:
_GET_: `/api/products`

```json
{
  "data": [
    {
      "attributes": {
        "description": "A very tasty burger straight from the state of Kentucky",
        "id": 183,
        "name": "Texas Grander 2",
        "photo-url": "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2102&q=80",
        "price": "19.99",
        "quantity-limit": 99,
        "thumbnail-url": "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=50"
      },
      "id": "183",
      "links": {
        "self": "http://localhost/api/products/183"
      },
      "relationships": {},
      "type": "products"
    }, {
      ...
    },
  ]
}
```

Same goes with:

- _GET_: `/api/products/{PRODUCT_ID}`
- _POST_: `/api/products`
- _PUT_: `/api/products/{PRODUCT_ID}`
- _DELETE_: `/api/products/{PRODUCT_ID}`

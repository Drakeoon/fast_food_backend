# FastFoodBackend

This is the backend for https://github.com/AlanPieczonka/fast-food-frontend

It's written in Phoenix with addition of Absinthe to support GraphQL queries.

Heavily inspired by https://github.com/schneidmaster/socializer.

# Setup

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Visit `http://localhost:4000/graphiql` to open GraphiQL workspace, where you can try GraphQL queries out!

Example query:

```
query {
  products {
    name
    price
    description
  }
}
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

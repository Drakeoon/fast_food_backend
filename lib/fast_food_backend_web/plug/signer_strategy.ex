defmodule FastFoodBackendWeb.SignerStrategy do
  use JokenJwks.DefaultStrategyTemplate

  def init_opts(opts) do
    url =  "https://fastfoodapp.eu.auth0.com/.well-known/jwks.json"
    Keyword.merge(opts, jwks_url: url)
  end
end

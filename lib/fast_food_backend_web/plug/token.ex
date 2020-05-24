defmodule Token do
  use Joken.Config, default_signer: nil # no signer
  alias FastFoodBackendWeb.SignerStrategy

  # This hook implements a before_verify callback that checks whether it has a signer configuration
  # cached. If it does not, it tries to fetch it from the jwks_url.
  add_hook(JokenJwks, strategy: SignerStrategy)

  @impl true
  def token_config do
    default_claims(skip: [:aud, :iss])
    |> add_claim("iss", nil, &(&1 == "https://fastfoodapp.eu.auth0.com/"))
    |> add_claim("aud", nil, &(Enum.member?(&1, "https://localhost:4000")))
  end
end

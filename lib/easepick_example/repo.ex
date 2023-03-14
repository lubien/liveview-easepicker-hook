defmodule EasepickExample.Repo do
  use Ecto.Repo,
    otp_app: :easepick_example,
    adapter: Ecto.Adapters.Postgres
end

defmodule EasepickExampleWeb.PageLive do
  use EasepickExampleWeb, :live_view

  def mount(_params, _session, socket) do
    dates = {~D[2023-03-01], ~D[2023-03-07]}
    initial_dates = Easepicker.to_string(dates)

    {:ok, assign(socket, form_state: %{
      "datepicker" => initial_dates
    })}
  end

  def handle_event("form_changed", %{"example_form" => params}, socket) do
    datestring = params["datepicker"]
    IO.puts("Dates are #{inspect(Easepicker.from_string(datestring))}")
    {:noreply, assign(socket, form_state: params)}
  end

  def render(assigns) do
    ~H"""
    <div>
      Form state: <%= inspect(@form_state) %>

      <.form :let={f} for={@form_state} as={:example_form} phx-change="form_changed">
        <div id="datepicker-container" phx-update="ignore">
          <.input field={f[:datepicker]} id="datepicker" phx-hook="Easepicker" />
        </div>
      </.form>
    </div>
    """
  end
end

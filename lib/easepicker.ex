defmodule Easepicker do
  def from_string(dates_string) do
    String.split(dates_string, " - ")
    |> Enum.map(&String.trim/1)
    |> Enum.map(&Date.from_iso8601!/1)
    |> List.to_tuple()
  end

  def to_string({start_date, end_date}) do
    [start_date, end_date]
    |> Enum.map(&Date.to_iso8601/1)
    |> Enum.join(" - ")
  end
end

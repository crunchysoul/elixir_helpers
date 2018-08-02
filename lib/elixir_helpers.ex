defmodule ElixirHelpers do
  @moduledoc """
  Elixir Helper functions created or collected by crunchysoul@github
  """

  @doc """
  Camelize Keys in map

  ## Examples

  iex> ElixirHelpers.camelize( %{"foo_bar" => "foo bar", :bar_foo => "bar foo", "bar_qua quz" => "bar qua quz"} )
      %{"barFoo" => "bar foo", "barQua quz" => "bar qua quz", "fooBar" => "foo bar"}

  """
  def camelize(map) when is_map(map) do
    map
    |> Enum.map(fn {key, value} -> {camelize_key(key), value} end)
    |> Enum.into(%{})
  end

  defp camelize_key(key) when is_atom(key), do: key |> to_string |> camelize_key

  defp camelize_key(key) when is_bitstring(key) do
    key
    |> String.split("_")
    |> Enum.reduce([], &camel_case/2)
    |> Enum.join()
  end

  defp camel_case(item, []), do: [item]
  defp camel_case(item, list), do: list ++ [String.capitalize(item)]
end

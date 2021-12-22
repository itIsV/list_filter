defmodule ListFilter do
  def call(list) when is_list(list), do: convert_to_number(list)

  def call(_list), do: IO.inspect(" The parameter need to be a list of strings")

  defp convert_to_number(list) do
    case Enum.any?(list, fn element -> not is_bitstring(element) end) do
      true ->
        IO.inspect(" The parameter need to be a list of strings")

      false ->
        numbers_and_errors = Enum.map(list, fn x -> Integer.parse(x) end)
        filter_numbers(numbers_and_errors)
    end
  end

  defp filter_numbers(list) do
    list_without_errors = Enum.reject(list, fn element -> element == :error end)
    numbers = Enum.map(list_without_errors, fn {number, _quote} -> number end)
    odd_count(numbers)
  end

  defp odd_count(list) do
    count = Enum.count(list, fn number -> rem(number, 2) != 0 end)
    count
  end
end

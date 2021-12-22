defmodule ListFilter do
  def call(list), do: convert_to_number(list)

  defp convert_to_number(list) do
    numbers_and_errors = Enum.map(list, fn x -> Integer.parse(x) end)

    filter_numbers(numbers_and_errors)
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

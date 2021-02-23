defmodule Rocketpay.Numbers do
  def sum_from_file(filename) do
    File.read("#{filename}.csv")
    |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result
    |> String.replace("\n", "")
    |> String.split(",")
    |> Enum.map(fn number -> String.to_integer(number) end)
    |> Enum.sum()
    |> (fn result -> {:ok, %{result: result}} end).()

    
  end
  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"}}
  end

defmodule Rocketpay.NumbersTest do
  use ExUnit.Case
  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "where there is a file with the given name, return the sum of numbers" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 10}}

      assert response == expected_response
    end

    test "where there is NOT a file with the given name, return the sum of numbers" do
      response = Numbers.sum_from_file("random_string")

      expected_response = {:error, %{message: "Invalid file!"}}

      assert response == expected_response
    end

  end
end

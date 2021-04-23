defmodule Inmana.WelcomerTest do
  use ExUnit.Case, async: true
  alias Inmana.Welcomer
  
  describe "welcome/1" do
    test "when the user is special, return a special message" do
      params = %{"name" => "banana", "age" => "42"}
      result = Welcomer.welcome(params)

      expected_result = {:ok, "You're very special banana"}

      assert result == expected_result
    end
    
    test "when the user is not special, return a normal message" do
      params = %{"name" => "gabriel", "age" => "42"}
      result = Welcomer.welcome(params)

      expected_result = {:ok, "Welcome gabriel"}

      assert result == expected_result
    end

    test "when the user is underage, return an error" do
      params = %{"name" => "gabriel", "age" => "17"}
      result = Welcomer.welcome(params)

      expected_result = {:error, "You shall not pass gabriel"}

      assert result == expected_result
    end

  end
end 

defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true
  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "When all params are valid, returns a valid changeset" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}

      response = Restaurant.changeset(params)
      assert %Changeset{changes: %{email: "siri@cascudo.com", name: "Siri cascudo"}, valid?: true} = response
    end
   
    test "When params aren't valid, returns an invalid changeset" do
      params = %{name: "S", email: ""}
      expected_response = %{email: ["can't be blank"], 
                            name: ["should be at least 2 character(s)"]}

      response = Restaurant.changeset(params)
      assert %Changeset{valid?: false} = response
      assert errors_on(response) == expected_response
    end
  end
end

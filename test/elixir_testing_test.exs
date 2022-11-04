defmodule ElixirTestingTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  test "Internet dropdown test" do
    navigate_to("https://the-internet.herokuapp.com/")

    dropdownLink = find_element(:xpath, "/html/body/div[2]/div/ul/li[11]/a")
    click(dropdownLink)

    dropdownBox = find_element(:xpath, "/html/body/div[2]/div/div/select")
    click(dropdownBox)

    option1 = find_element(:xpath, "/html/body/div[2]/div/div/select/option[2]")
    click(option1)

    dropdownValue = visible_text(dropdownBox)
    assert dropdownValue == "Option 1"

  end
end

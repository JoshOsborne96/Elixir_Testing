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

    option2 = find_element(:xpath, "/html/body/div[2]/div/div/select/option[3]")

    option1Selected = attribute_value(option1, "selected")
    option2Selected = attribute_value(option2, "selected")

    assert option1Selected == "true"
    assert option2Selected == nil

  end

hound_session()

  test "Login page test - successful login" do
    navigate_to("https://the-internet.herokuapp.com/")

    formAuthLink1 = find_element(:xpath, "/html/body/div[2]/div/ul/li[21]/a")
    click(formAuthLink1)

    usernameField1 = find_element(:xpath, "/html/body/div[2]/div/div/form/div[1]/div/input")
    fill_field(usernameField1, "tomsmith")

    passwordField1 = find_element(:xpath, "/html/body/div[2]/div/div/form/div[2]/div/input")
    fill_field(passwordField1, "SuperSecretPassword!")

    loginBtn1 = find_element(:xpath, "/html/body/div[2]/div/div/form/button/i")
    click(loginBtn1)

    secureArea = find_element(:xpath, "/html/body/div[1]/div/div")

    loginSuccess = element_displayed?(secureArea)

    assert loginSuccess == true

  end

hound_session()

  test "Login page test - successful logout" do
    navigate_to("https://the-internet.herokuapp.com/")

    formAuthLink2 = find_element(:xpath, "/html/body/div[2]/div/ul/li[21]/a")
    click(formAuthLink2)

    usernameField2 = find_element(:xpath, "/html/body/div[2]/div/div/form/div[1]/div/input")
    fill_field(usernameField2, "tomsmith")

    passwordField2 = find_element(:xpath, "/html/body/div[2]/div/div/form/div[2]/div/input")
    fill_field(passwordField2, "SuperSecretPassword!")

    loginBtn2 = find_element(:xpath, "/html/body/div[2]/div/div/form/button/i")
    click(loginBtn2)

    logoutbtn = find_element(:xpath, "/html/body/div[2]/div/div/a")
    click(logoutbtn)

    logoutArea = find_element(:xpath, "/html/body/div[1]/div/div")

    logoutSuccess = element_displayed?(logoutArea)

    assert logoutSuccess == true

  end

  hound_session()

  test "Checkbox test" do
    navigate_to("https://the-internet.herokuapp.com/")

    checkboxes_link = find_element(:xpath, "/html/body/div[2]/div/ul/li[6]/a")
    click(checkboxes_link)

    checkbox_1_radio = find_element(:xpath, "/html/body/div[2]/div/div/form/input[1]")
    click(checkbox_1_radio)

    checkbox_2_radio = find_element(:xpath, "/html/body/div[2]/div/div/form/input[2]")
    click(checkbox_2_radio)

    assert selected?(checkbox_1_radio) == true
    assert selected?(checkbox_2_radio) == false

  end

  hound_session()

  test "Key presses test" do
    navigate_to("https://the-internet.herokuapp.com/")

    key_press_link = find_element(:xpath, "/html/body/div[2]/div/ul/li[31]/a")
    click(key_press_link)

    input_field = find_element(:id, "target")
    click(input_field)

    send_keys :control

    control_sent = find_element(:xpath, "/html/body/div[2]/div/div/p[2]")

    assert inner_text(control_sent) == "You entered: CONTROL"
    assert visible_text(control_sent) == "You entered: CONTROL"
    assert inner_text(control_sent) != "You entered: ENTER"

  end

end

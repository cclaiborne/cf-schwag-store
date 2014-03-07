require "test_helper"

feature "CanClickCartLink" do
  scenario "User visits home page and clicks on the cart link" do
    visit root_path
    click_button('My Cart')
  end
end

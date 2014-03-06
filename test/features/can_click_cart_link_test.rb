require "test_helper"

feature "CanClickCartLink" do
  scenario "the test is sound" do
    visit root_path
    save_and_open_page
    click_button('My Cart')
  end
end

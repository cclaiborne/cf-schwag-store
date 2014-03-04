require "test_helper"

feature "CanClickCartLink" do
  scenario "the test is sound" do
    visit root_path
    click_button("cart")
  end
end

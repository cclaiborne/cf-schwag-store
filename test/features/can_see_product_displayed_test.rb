require "test_helper"

feature "CanSeeProductDisplayed" do
  scenario "the test is sound" do
    visit root_path
    page.has_content('products')
  end
end

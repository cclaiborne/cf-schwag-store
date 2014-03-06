require "test_helper"

feature "CanSeeProductDisplayed" do
  scenario "the test is sound" do
    visit root_path
    save_and_open_page
    page.has_content('snom 870')
  end
end

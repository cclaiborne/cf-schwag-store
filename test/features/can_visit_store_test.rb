require "test_helper"

feature "CanVisitStore" do
  scenario "User visits home page" do
    visit root_path
  end
end

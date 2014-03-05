require "test_helper"

feature "CanClickProductLink" do
  scenario "the test is sound" do
    visit root_path
    click_on("product")
    #add statement to confirm user is on product page
  end
end

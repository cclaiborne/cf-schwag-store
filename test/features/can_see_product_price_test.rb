require "test_helper"

feature "CanSeeProductPrice" do
  scenario "the test is sound" do
    visit product_path(1)
    page.must_have_content "price"

  end
end

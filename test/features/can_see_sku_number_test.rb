require "test_helper"

feature "CanSeeSkuNumber" do
  scenario "the test is sound" do
    visit product_path(1)
    page.must_have_content "SKU"

  end
end

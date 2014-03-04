require "test_helper"

feature "CanAddProductToCart" do
  scenario "the test is sound" do
    visit root_path
    click_button("addtocart")
  end
end

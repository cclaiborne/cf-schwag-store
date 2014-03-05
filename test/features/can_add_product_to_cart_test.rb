require "test_helper"

feature "CanAddProductToCart" do
  scenario "the test is sound" do
    visit root_path
    click_button("addtocart")
    page.has.content?('product has been added to cart')
  end
end

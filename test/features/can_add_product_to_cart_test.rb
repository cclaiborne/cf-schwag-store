require "test_helper"

feature "CanAddProductToCart" do
  scenario "the test is sound" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product)
    p1.product_category_id = catalogue.id
    p1.save
    visit product_path(p1.permalink)
    click_on("ADD TO CART")
    page.must_have_content "Product has been added successfuly!"
  end
end

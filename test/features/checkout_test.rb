require "test_helper"

feature "User begins the checkout process" do
  scenario "User navigates to checkout page and cart is displayed" do
    p1 = create(:stock_product) 
    p1.save
    visit product_path(p1.permalink)
    click_on("ADD TO CART")
    page.must_have_content "Product has been added successfuly!"
    visit checkout_path
    save_and_open_page
  end
  
end

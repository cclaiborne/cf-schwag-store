require 'test_helper'

feature "When user visits cart page, they can empty their cart" do
  scenario "User puts an item in cart, visits cart page, deletes content of cart" do
    p1 = create(:stock_product) 
    p1.save
    visit product_path(p1.permalink)
    click_on("ADD TO CART")
    page.must_have_content "Product has been added successfuly!"
    visit basket_path
    page.must_have_content "Order items in my carts:"
    click_link "Empty My Cart"
    page.must_have_content "0 items" 
    save_and_open_page    
  end
end

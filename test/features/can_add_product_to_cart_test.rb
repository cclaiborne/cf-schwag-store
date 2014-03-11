require "test_helper"

feature "CanAddProductToCart" do
  scenario "User visits product page and adds item to cart" do
    p1 = create(:stock_product) 
    p1.save
    visit product_path(p1.permalink)
    click_on("ADD TO CART")
    page.must_have_content "Product has been added successfuly!"
    visit checkout_path
    page.must_have_content "Checkout"
    visit checkout_payment_path
    save_and_open_page
  end
end

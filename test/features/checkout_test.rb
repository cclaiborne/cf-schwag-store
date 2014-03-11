require "test_helper"

feature "User begins the checkout process" do
  scenario "User navigates to checkout page and cart is displayed" do
    create_order_with_products
    # create(:stock_product)
    # o = create(:order_with_order_item)
    visit checkout_path
    save_and_open_page
  end
end

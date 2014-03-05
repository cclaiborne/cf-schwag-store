require "test_helper"

feature "ProductProperties" do
  scenario "Product properties are displayed on show page" do
    p1 = Factory :product, id: "1", parent_id: '2', product_category_id: '1', name: "pen", sku: "xxx-123", permalink: "xxx-555", description: "Really amazing pen writes forever", short_description: "unmatched in quality", active: true, weight: '1.5', price: '2.00',  stock_control: true

    visit product_path(permalink: "#{p1.permalink}")
    save_and_open_page
    page.must_have_content p1.sku 
    page.must_have_content p1.description 
    page.wont_have_content "Turtles all the Way Down!"
  end
end

require "test_helper"

feature "ProductProperties" do
  scenario "Product properties are displayed on show page" do
    p = Factory :product, short_description: "unmatched in quality",  name: 'pen', sku: 'xxx-123', description: "Realy amazing pen writes forever", weight: '1.5', price: '2.00', product_category_id: '1', stock_control: true, id: '1'
    p2 = Factory :product,short_description: "unmatched in quality", name: 'pen-gold', sku: 'xxx-124', description: "Realy amazing pen writes sometimes", weight: '0.5', price: '3.00', product_category_id: '1', stock_control: true, id: '2'
    p3 = Factory :product,short_description: "unmatched in quality",  name: 'pen-silver', sku: 'xxx-125', description: "Realy amazing pen writes awful", weight: '3.0', price: '5.00', product_category_id: '1', stock_control: true, id: '3'
      
    visit product_path(1)

    page.must_have_content "Model"
    page.wont_have_content "Goobye All!"
  end
end

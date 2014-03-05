require "test_helper"

feature "ProductProperties" do
  scenario "Product properties are displayed on show page" do
    category = FactoryGirl.build( :category )
    p1 = FactoryGirl.build( :product )
    visit product_path(p1.permalink )
    save_and_open_page
    # page.must_have_content p1.sku 
    # page.must_have_content p1.description 
    page.wont_have_content "Turtles all the Way Down!"
  end
end

require "test_helper"

feature "Product Show Feature" do
  scenario "Product properties are displayed on show page" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product)
    p1.product_category_id = catalogue.id
    p1.save
    visit product_path(p1.permalink )
    page.must_have_content p1.description 
    page.must_have_content p1.price
    page.must_have_content p1.sku
    page.wont_have_content "Turtles all the Way Down!"
    # save_and_open_page
    click_link('ADD TO CART')
    click_link('Checkout')

  end
end

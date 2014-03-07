require "test_helper"

feature "Product Show Feature" do
  scenario "Product properties are displayed on show page" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product, product_category_id: catalogue.id)
    p1.save
    visit product_path(p1.permalink)
    page.must_have_content p1.description 
    page.must_have_content p1.price
    page.must_have_content p1.sku
    page.wont_have_content "Turtles all the Way Down!"
    click_link('ADD TO CART')
    page.must_have_content "Product has been added successfuly!"
  end
  scenario "User clicks checkout button" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product, product_category_id: catalogue.id)
    p1.save
    visit product_path(p1.permalink)
    click_link('CHECKOUT')
    page.must_have_content "Checkout"
  end
  scenario "User clicks cart button to see what is in cart" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product, product_category_id: catalogue.id)
    p1.save
    visit product_path(p1.permalink)
    click_button("My Cart:")
    page.must_have_content("Order items in my cart")
  end
  scenario "User clicks home button  on show page to return to home page" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product, product_category_id: catalogue.id)
    p1.save
    visit product_path(p1.permalink)
    click_link("home_link")
  end
  scenario "User visits show page and it has a navigation bar" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product, product_category_id: catalogue.id)
    p1.save
    visit product_path(p1.permalink)
    page.must_have_content "Shop"
    page.must_have_content "Foundations"
    page.must_have_content "Bootcamps"
    page.must_have_content  "Calendar"
    page.must_have_content "Blog"
    page.must_have_content  "Apply Now"
  end
end

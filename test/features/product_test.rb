require "test_helper"

feature "Product Show Page" do
  scenario "Product properties are displayed on show page" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product, product_category_id: catalogue.id)
    p1.save
    visit product_path(p1.permalink)
    page.must_have_content p1.description 
    page.must_have_content p1.price
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
    find_link('Shop').visible? 
    find_link('Foundations').visible? 
    find_link('Bootcamps').visible? 
    find_link('Calendar').visible? 
    find_link('Blog').visible? 
    find_link('Apply Now').visible? 
  end
end

require "test_helper"

feature "Product Show Feature" do
  scenario "Product properties are displayed on show page" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product)
    p1.product_category_id = catalogue.id
    p1.save
    visit product_path(p1.permalink )
<<<<<<< HEAD
    page.must_have_content p1.description
    # page.must_have_content p1.description
=======
    # binding.pry
    page.must_have_content p1.description 
    page.must_have_content p1.price
    page.must_have_content p1.sku
>>>>>>> 1bb11d112c39ab375040d783e8b5e366a1428ecf
    page.wont_have_content "Turtles all the Way Down!"
    #stuff
    # save_and_open_page
  end
end

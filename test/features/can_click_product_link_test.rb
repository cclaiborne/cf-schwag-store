require "test_helper"

feature "CanClickProductLink" do
  scenario "the test is sound" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product)
    p1.product_category_id = catalogue.id
    p1.save
    visit root_path
    click_on(p1.name)
    #add statement to confirm user is on product page
  end
end

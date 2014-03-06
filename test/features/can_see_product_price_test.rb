require "test_helper"

feature "CanSeeProductPrice" do
  scenario "the test is sound" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product)
    p1.product_category_id = catalogue.id
    p1.save
    visit product_path(p1.permalink )
    #product name is displayed
    page.must_have_content p1.price

  end
end

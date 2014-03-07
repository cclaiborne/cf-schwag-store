require "test_helper"

feature "CanSeeProductDisplayed" do
  scenario "User visits root path and " do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product, product_category_id: catalogue.id)
    p1.save
    visit root_path
    page.must_have_content "Pen"
  end
end

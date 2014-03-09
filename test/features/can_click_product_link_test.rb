require "test_helper"

feature "CanClickProductLink" do
  scenario "User visits home page and clicks on a product link" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product)
    p1.product_category_id = catalogue.id
    p1.save
    visit root_path
    click_on(p1.name)
    page.must_have_content p1.name
  end
end

require "test_helper"

feature "ProductShowFeature" do
    scenario "CanSeeSkuNumber" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product)
    p1.product_category_id = catalogue.id
    p1.save
    visit product_path(p1.permalink)
    page.must_have_content p1.sku
    save_and_open_page
  end
end

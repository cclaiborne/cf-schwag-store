require "test_helper"

feature "CanVisitStore" do
  scenario "User visits home page" do
    catalogue = FactoryGirl.create(:category)
    p1 = FactoryGirl.create(:product, product_category_id: catalogue.id)
    p1.save
    visit root_path
    # find_link(p1.name).visible? 
    page.must_have_content ActionController::Base.helpers.number_to_currency( p1.price ) 
    # page.has_css?('img') 
    page.must_have_content "Code Fellows"
    page.must_have_css('img') 
    page.must_have_xpath('//ul/li') 
    page.must_have_xpath('//div/h5') 
     
    save_and_open_page
  end
end

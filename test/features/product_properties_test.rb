require "test_helper"

feature "ProductProperties" do
  scenario "Product properties are displayed on show page" do
    visit product_path
    page.must_have_content "Hello World"
    page.wont_have_content "Goobye All!"
  end
end

require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "capybara-webkit"
require 'capybara/dsl'
require 'mocha'
require "turn/autorun"
require "factory_girl_rails"

# Capybara.default_driver = :webkit


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Dry up building product

# class Product 
#   def new 
#     catalogue = FactoryGirl.create(:category)
#     p1 = FactoryGirl.create(:product, product_category_id: catalogue.id)
#     p1.product_category_id = catalogue.id
#     p1.save
#   end
# end   

Turn.config.format = :outline


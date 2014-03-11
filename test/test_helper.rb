require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
# require "capybara-webkit"
require 'capybara/dsl'
require 'mocha'
require "turn/autorun"
require "factory_girl_rails"
# FactoryGirl.find_definitions

# Capybara.default_driver = :webkit


# require "minitest/pride"

class ActiveSupport::TestCase 
  include FactoryGirl::Syntax::Methods 
  
  private

  def create_order_with_products(options = {})
    order = create(:order)
    # create a product and a line item
    product1 = create(:yealink_t22p, :initial_stock => options[:stock] || 10)
    order.order_items.create!(:quantity => options[:quantity] || 2, :ordered_item => product1)
    product2 = create(:snom_870, :initial_stock => options[:stock] || 10)
    order.order_items.create!(:quantity => options[:quantity] || 1, :ordered_item => product2)
    
    if options[:confirmed]
      order.confirm!
    end
    
    # return the order
    order
  end 
  def create_environment
    # add delivery services
    create(:first_class_post_with_prices)
    create(:delivery_service_with_prices)
    create(:saturday_delivery_with_prices)
    # add some countries
    create(:uk)
    create(:us)
    create(:france)
  end
   
end

Turn.config.format = :outline


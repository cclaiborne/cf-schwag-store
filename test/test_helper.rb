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
# Factory.find_definitions

# Capybara.default_driver = :webkit


# require "minitest/pride"

class ActiveSupport::TestCase 
  include FactoryGirl::Syntax::Methods 
  
  private

  def create_order_with_products(options = {})
  order = create(:order)
  # create a product and a line
  product1 = create(:yealink_t22p, :initial_stock => options[:stock] || 10)
  item1 = order.order_items.create!(:quantity => options[:quantity] || 2, :ordered_item => product1)
  # create another product and a link
  product2 = create(:snom_870, :initial_stock => options[:stock] || 10)
    item2 = order.order_items.create!(:quantity => options[:quantity] || 1, :ordered_item => product2)
    
    if options[:confirmed]
      order.confirm!
    end
    
    # return the order
    order
  end 
end

Turn.config.format = :outline


source 'https://rubygems.org'
ruby '2.1.0'

gem 'rails', '4.0.3'

gem 'coffee-rails', '~> 4.0.0'
gem 'figaro'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'minitest-rails'
gem 'newrelic_rpm'
gem 'sass-rails', '~> 4.0.0'
gem 'shoppe', '~> 0.0.0'
gem 'shoppe-stripe', :require => 'shoppe/stripe'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'zurb-foundation'

group :test do
  gem 'capybara-webkit'
  gem 'minitest-rails-capybara'
  gem 'simplecov', '~> 0.7.1', :require => false
  gem 'turn'
end

group :development, :test do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller', github: "banister/binding_of_caller" # This needs to go in before better_errors
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'meta_request', '0.2.1'
  gem 'mocha'
  gem 'pry-debugger', github: 'nixme/pry-debugger'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


source 'https://rubygems.org'

gem 'rails', '4.0.3'
gem 'figaro'
gem 'zurb-foundation'
gem 'sass-rails', '~> 4.0.0'
gem 'shoppe', '~> 0.0.0'
gem 'shoppe-stripe', :require => 'shoppe/stripe'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

gem 'minitest-rails'
gem 'factory_girl_rails'

group :test do
  gem "minitest-rails-capybara"
  gem 'capybara-webkit'
  gem 'miniskirt'
  gem 'turn'
  gem 'simplecov', :require => false
end
  # gem 'debugger', "1.6.5"

group :development, :test do
  gem 'awesome_print'
  gem 'sqlite3'
  gem 'binding_of_caller', github: "banister/binding_of_caller" # This needs to go in before better_errors
  gem 'better_errors'
  gem 'meta_request', '0.2.1'
  gem 'pry-rails'
  gem 'pry-debugger', github: 'nixme/pry-debugger'
  gem 'pry-rescue'
  gem 'mocha'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

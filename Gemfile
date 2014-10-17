source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'





# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


gem 'rails_12factor', group: :production

# Views
# Use jquery as the JavaScript library
gem 'jquery-rails'


# Models
gem "compass-rails", "~> 1.1.2"
gem "foundation-rails", "~> 5.0.3.1"
gem 'high_voltage'
gem 'font-awesome-rails'
gem 'slim', '~> 2.0.2'

# Contact Page
gem 'simple_form'

#Blog Engine
gem 'bloggy'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', :require => false
end

# User for storing environment variables
gem "figaro", "~> 0.7.0"

# Used to get data from the url
gem "rest-client", "~> 1.6.7"

# Let's us handle errors and know how to deal with it
gem "better_errors", "~> 1.0.1", group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'


# Use Capistrano for deployment
group :development do
  gem 'capistrano', '~> 2.15.5'
  gem 'capistrano-rails', '~> 1.0.0'
  #other development gems...
end

# Using PG gem for Production DB
group :production, :staging do
 	gem "pg", "~> 0.17.1"
end

# Use Sqlite3 as the database for Active Record
group :development, :test do
  gem "sqlite3-ruby", "~> 1.3.0", :require => "sqlite3"
end

# Use debugger
# gem 'debugger', group: [:development, :test]



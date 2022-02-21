source 'https://rubygems.org'

# Rails 3.2 doesn't work on Ruby >= 2.4, but Heroku only supports down to 2.4 on heroku-18.
# https://devcenter.heroku.com/articles/ruby-support#oldest-available-runtimes
# I did mad hacks to get rails to work on 2.4 to buy at least a year.
ruby '2.4.10'

gem 'rails', '3.2.22.5'
gem 'bootstrap-sass'
gem 'strong_parameters'
gem 'haml-rails'
gem 'active_model_serializers'
gem 'bcrypt-ruby'
gem 'json', '~> 1.8.6'
gem 'bigdecimal', '1.4.2'

group :development, :test do
  gem 'sqlite3', '~> 1.3.6'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'childprocess'
  gem 'spork'
  gem 'faker'
  # gem 'debugger'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  gem 'capybara'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false
end

group :production do
  gem 'pg', '~> 0.21'
end

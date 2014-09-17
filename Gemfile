source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.13'
gem 'bootstrap-sass'
gem 'strong_parameters'
gem 'haml-rails'
gem 'active_model_serializers'
gem 'bcrypt-ruby'

group :development, :test do
  gem 'sqlite3'
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
  gem 'pg'
end

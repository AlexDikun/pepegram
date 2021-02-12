# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'bcrypt', '3.1.15'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'devise', '~> 4.7', '>= 4.7.2'
gem 'image_processing', '~> 1.12', '>= 1.12.1'
gem 'jbuilder', '~> 2.7'
gem 'pundit', '~> 2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
gem 'rubocop', '~> 0.89.1', require: false
gem 'rubocop-rails', '~> 2.7', '>= 2.7.1', require: false
gem 'sass-rails', '>= 6'
gem 'shrine', '~> 3.2', '>= 3.2.2'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'capybara-headless_chrome', '~> 0.6.3'
  gem 'database_cleaner-active_record'
  gem 'database_cleaner-redis'
  gem 'factory_bot', '~> 4.8', '>= 4.8.2'
  gem 'ffaker', '~> 2.17'
  gem 'shoulda-matchers', '~> 4.3'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'devise', '~> 4.7', '>= 4.7.2'
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'rubocop', '~> 0.89.1', require: false
gem 'rubocop-rails', '~> 2.7', '>= 2.7.1', require: false

gem 'bcrypt', '3.1.15'
gem 'shrine', '~> 3.2', '>= 3.2.2'

group :development, :test do
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'shoulda-matchers', '~> 4.3'
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner-active_record'
  # gem 'database_cleaner-redis'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

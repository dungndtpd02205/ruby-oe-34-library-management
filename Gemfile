source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.1 "

gem "active_storage_validations", "0.8.2"
gem "bcrypt", "3.1.13"
gem "bootsnap", "1.4.6", require: false
gem "bootstrap-sass", "3.4.1"
gem "bootstrap-will_paginate"
gem "config"
gem "faker"
gem "figaro"
gem "image_processing"
gem "jbuilder", "2.10.0"
gem "jquery-rails"
gem "mini_magick"
gem "puma", "4.3.5"
gem "rails", "6.0.3.2"
gem "rails-i18n"
gem "sass-rails", "6.0.0"
gem "turbolinks", "5.2.1"
gem "webpacker", "4.2.2"
gem "will_paginate"

group :development, :test do
  gem "byebug", "11.1.3", platforms: [:mri, :mingw, :x64_mingw]
  gem "sqlite3", "1.4.2"
end

group :development do
  gem "listen", "3.2.1"
  gem "spring", "2.1.0"
  gem "spring-watcher-listen", "2.0.1"
  gem "web-console", "4.0.2"
end

group :test do
  gem "capybara", "3.32.2"
  gem "selenium-webdriver", "3.142.7"
  gem "webdrivers", "4.3.0"
end

group :development, :test do
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
end

# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Repository for collecting Locale data for Ruby on Rails I18n as well as other interesting, Rails related I18n stuff
#gem 'rails-i18n'
gem 'rails-i18n', '~> 5.1' # For 5.0.x, 5.1.x and 5.2.x
# Manage Procfile-based applications
gem 'foreman'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
# Flexible authentication solution for Rails with Warden.
gem 'devise'
# Translations for the devise gem
gem 'devise-i18n'
# Use jquery as the JavaScript library
gem 'jquery-rails'

# jQuery UI for the Rails asset pipeline
gem 'jquery-ui-rails'

# Help ActiveRecord::Enum feature to work fine with I18n and simple_form.
gem 'enum_help'

source 'https://rails-assets.org' do
  # Bootstrap
  gem 'rails-assets-bootstrap', '3.3.6'

  # BootboxJS
  gem 'rails-assets-bootbox'

  # This is a simple plugin that turns standard Bootstrap alerts into "Growl-like" notifications.
  gem 'rails-assets-bootstrap.growl'

  # Animate CSS - Para dar efeito de animação nas mensagens de alerta.
  gem 'rails-assets-animate-css'

  # Bootstrap plugin for markdown editing
  gem 'rails-assets-bootstrap-markdown'

  # A markdown parser and compiler. Built for speed.
  gem 'rails-assets-marked'
end

# Rails gem of the Bootstrap based admin theme SB Admin 2.
gem 'bootstrap_sb_admin_base_v2'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Minimal authorization through OO design and pure Ruby classes
gem 'pundit'

# Integration of RubyMoney - Money with Rails
gem 'money-rails', '~>1'

# Easy file attachment management for ActiveRecord
gem "paperclip", "~> 6.0.0"

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# The safe Markdown parser, reloaded.
gem 'redcarpet'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # A library for generating fake data such as names, addresses, and phone numbers.
  gem 'faker'
  # MailCatcher runs a super simple SMTP server which catches any message sent to it to display in a web interface. 
  gem 'mailcatcher'
  # O Lero-lero Generator é uma ferramenta capaz de gerar frases que 'falam' muita coisa mas que não tem conteúdo algum.
  gem 'lerolero_generator'

  # Markdown Lorem Ipsum generator
  gem 'doctor_ipsum'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Better error page for Rack apps
  gem 'better_errors'
  # Generate Entity-Relationship Diagrams for Rails applications
  gem 'rails-erd'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.1'
gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'redis', '~> 5.2'
gem 'sidekiq', '~> 7.2', '>= 7.2.4'
gem 'sidekiq-scheduler', '~> 5.0', '>= 5.0.3'

gem 'guard'
gem 'guard-livereload', require: false

gem 'active_model_serializers', '~> 0.10.15'

group :development, :test do
  gem 'byebug', '~> 11.1', '>= 11.1.3'
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.4'
  gem 'rspec-rails', '~> 6.1.0'
  gem 'rubocop', '~> 1.71'
  gem 'shoulda-matchers', '~> 6.4'
end
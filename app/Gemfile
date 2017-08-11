# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.3.1"
gem "sinatra", '~> 1.4.7'
gem "sinatra-contrib", '~> 1.4.7'
gem 'sinatra-activerecord', '~> 2.0.10'

group :development, :test do
  gem 'rake', '~> 11.2.2'
end

group :test do
  gem 'minitest', require: 'minitest/autorun'
  gem 'rack-test', require: 'rack/test'
end

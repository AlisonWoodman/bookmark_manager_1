ENV["RACK_ENV"] = "test"

require_relative './features/web_helpers'

require 'capybara/rspec'
require 'capybara'
require 'rspec'
require 'pry'
require 'simplecov'
require 'simplecov-console'
require 'database_cleaner'
require_relative '../app/app.rb'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

Capybara.app = Bookmark

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

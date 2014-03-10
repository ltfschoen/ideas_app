ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# http://stackoverflow.com/questions/21557464/rails-minitest-devise-error

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending! 
  
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase

  include Devise::TestHelpers
  
end
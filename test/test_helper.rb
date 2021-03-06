ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  #fixtures :all
  # Add more helper methods to be used by all tests here...
  include ApplicationHelper

  # Returns true if a test user is logged in.
  def is_logged_in?
  	!session[:user_id].nil?
  end
end

ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def sign_in_admin 
    @user = User.create(username: "Admin", email: "admin@admin.com", password: "admin", admin: true)
    post '/login', params: {email: "admin@admin.com", password: "admin"}
  end
  # Add more helper methods to be used by all tests here...
end

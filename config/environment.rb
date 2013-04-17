# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Pair::Application.initialize!
if ENV['RAILS_ENV'] == "production"
  ActiveSupport::Deprecation.silenced = true
end

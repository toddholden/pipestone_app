# Load the rails application
require File.expand_path('../application', __FILE__)

# Silence deprecation warnings - added on account of Heroku bug
# ActiveSupport::Deprecation.silenced = true

# Initialize the rails application
PipestoneApp::Application.initialize!
Date::DATE_FORMATS.merge!(:default => "%m/%d/%Y")

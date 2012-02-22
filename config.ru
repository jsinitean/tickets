# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run tickets::Application

web: bundle exec ruby web.rb -p $PORT
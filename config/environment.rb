# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.i18n.load_path += Dir[File.join(RAILS_ROOT, 'config', 'locales', '**', '*.{rb,yml}')] 
  config.gem 'authlogic'
  config.gem 'yaroslav-russian', :lib => 'russian', :source => 'http://gems.github.com', :version => ">= 0.2.1"
  config.gem "justinfrench-formtastic", :lib     => 'formtastic', :source  => 'http://gems.github.com'
  
  config.time_zone = 'UTC'
  config.i18n.default_locale = :ru
end

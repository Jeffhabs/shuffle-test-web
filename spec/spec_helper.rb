ENV["RAILS_ENV"] ||= 'test'

unless ENV["SIMPLECOV"] == 'false'
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter "/spec"
  end
end

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.after(:suite)  { DatabaseCleaner.clean_with :truncation }

  # config.after(:each)   { Timecop.return }

  config.infer_spec_type_from_file_location!
  config.expose_current_running_example_as :example

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.order = :random
end

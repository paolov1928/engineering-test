# frozen_string_literal: true
# This file is copied to spec/ when you run "rails generate rspec:install"
ENV["RAILS_ENV"] ||= "test"

if ENV.has_key?("CI")
  require "simplecov"
  SimpleCov.start "rails" do
    coverage_dir "coverage/backend"
  end
end

require File.expand_path("../../config/environment", __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
# Add additional requires below this line. Rails is not loaded until this point!

require "capybara/rails"

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Dir[Rails.root.join("spec/**/shared_examples/*.rb")].each do |f| require f end

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  config.include FactoryBot::Syntax::Methods

  # RSpec not able to infer shared partials that live in application folder
  #
  # @see https://github.com/rails/rails/issues/5213
  config.before(:each, type: :view) do
    view.lookup_context.prefixes << "application"
    view.extend Pundit
  end

  # Setting `config.verify_partial_doubles` to true prevents stubbing Rails
  # view helpers
  #
  # @see https://github.com/rspec/rspec-mocks/issues/633
  config.before(:each, type: :view) do
    RSpec::Mocks.configuration.verify_partial_doubles = false
  end

  config.after(:each, type: :view) do
    RSpec::Mocks.configuration.verify_partial_doubles = true
  end
end


#
# Database cleaner

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each, threaded: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

  config.append_after(:each, local_storage: true) do
    FileUtils.rm_rf(Rails.root.join("tmp", "storage"))
  end
end

#
# Capybara
#
# @note https://robots.thoughtbot.com/acceptance-tests-with-subdomains

Capybara.configure do |config|
  config.always_include_port = true
  config.javascript_driver = :chrome
  config.default_max_wait_time = ENV.has_key?("CI") ? 60 : 10
  config.app_host = "http://lvh.me"
end

RSpec.configure do |config|
  config.before(type: :request) do
    host! "lvh.me"
  end

  config.before(type: :feature) do
    default_url_options[:host] = "http://lvh.me:#{Capybara.server_port}"
  end
end

#
# Translations

module I18nHelper
  def t(*args)
    I18n.translate(*args)
  end

  def l(*args)
    I18n.localize(*args)
  end
end

RSpec.configure do |config|
  config.include I18nHelper, type: :feature
end

# Testing Threads

TEST_THREADS_LIMIT = 3 # bigger than 1 but less than RAILS_MAX_THREADS

#
# Shoulda Matchers

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
  end
end

RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveModel, type: :validator)
  config.include(Shoulda::Matchers::ActiveRecord, type: :validator)
end

#
# With Model
#
RSpec.configure do |config|
  config.extend WithModel
end

#
# Haml Helpers
RSpec.configure do |config|
  # Includes the necessary Haml helper module
  config.include Haml, type: :helper # or any other spec you need it in
  config.include Haml::Helpers, type: :helper
  config.before(:each, type: :helper) do |config|
    # Sets up the helpers
    init_haml_helpers
  end
end

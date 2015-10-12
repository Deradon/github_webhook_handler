source 'https://rubygems.org'

# Declare your gem's dependencies in github_webhook_handler.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

group :development, :test do
  gem "rspec-rails"
  gem "guard"
  gem "guard-rspec"
  gem "guard-zeus"
  gem "guard-bundler"

  gem "factory_girl_rails"

  gem "rb-fsevent"
  gem "ffaker"
  gem "pry"
end

group :development do
  gem "better_errors"
  gem "awesome_print"
  gem "brakeman"
end

group :test do
  gem "vcr"
  gem "webmock"
  gem "capybara"
  gem "simplecov", require: false
end

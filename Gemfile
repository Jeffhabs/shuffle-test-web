source 'https://rubygems.org'

# Primary Dependencies
gem 'rails', '4.2.4'
gem 'pg'

# Assets
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'therubyracer'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks'

# Controllers
gem 'has_scope'

# Deployment
gem 'app'

# Active Admin
gem 'activeadmin', github: 'activeadmin/activeadmin', branch: 'master'
gem 'active_skin'
gem 'cocoon'
gem 'devise'

group :development, :test do
  gem 'byebug'
  gem 'faker'

  # Helpful error console:
  gem 'better_errors'
  gem 'binding_of_caller'

  # Testing:
  gem 'rspec-rails'
  gem 'factory_girl_rails'

  # Keep sanity:
  gem 'quiet_assets'
  gem 'pry-rails'
end

group :development do
  gem 'annotate'
  gem 'letter_opener'

  # Guard
  gem 'guard-bundler', require: false
  gem 'guard-rake',    require: false
  gem 'guard-rspec',   require: false
  gem 'guard-pow',     require: false
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'simplecov',        require: false
  gem 'test_after_commit'
  # gem 'timecop'
  gem 'webmock',          require: false
end

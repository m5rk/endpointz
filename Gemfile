source 'https://rubygems.org'

# Workaround for bug in bundler, fixed in bundler 2.0.
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt'
gem 'jsonapi-rails'
gem 'jwt'
gem 'pg'
gem 'puma'
gem 'rails', '~> 5.1.5'
gem 'simple_command'
gem 'state_machine', github: 'seuros/state_machine'
gem 'versionist'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-collection_matchers'
  gem 'rspec-rails'
  gem 'timecop'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda'
  gem 'simplecov', require: false
  gem 'valid_attribute'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

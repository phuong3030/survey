source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rabl'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'tzinfo-data', '1.2019.3'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'rspec-rails', '~> 3.9.0'
  gem 'faker', '2.10.2'
  gem 'factory_bot_rails', '5.1.1'
  gem 'database_cleaner', '1.8.3'
  gem 'shoulda', '2.11.3'
  gem 'shoulda-matchers', '4.3.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in family_book.gemspec
gemspec

gem "rake", "~> 13.0"
gem "sqlite3"
gem "puma"

group :development, :test do
  gem "devup"
  gem "dotenv"
  gem "pry"
  gem "rspec", "~> 3.0"
  gem "standard"
end

group :test do
  gem "rack-test"
end

require "dotenv"

ENV["APP_ENV"] ||= "production"

if %w[development test].include? ENV.fetch("APP_ENV")
  Dotenv.load(".env.services")
  require "pry"
end

Dotenv.load(".env", ".env.#{ENV.fetch("APP_ENV")}", ".env.#{ENV.fetch("APP_ENV")}.local")

require "dry-container"

class AppContainer
  extend Dry::Container::Mixin

  register "db" do
    require "sequel"
    Sequel.connect(ENV.fetch("DATABASE_URL"), logger: resolve(:logger))
  end

  register "logger" do
    require "logger"

    logger = Logger.new($stdout)
    logger.level = ENV.fetch("LOGGER_LEVEL", "debug")

    logger
  end

  register "books" do
    require "family_book/books"
    FamilyBook::Books.new
  end
end

require "family_book"
FamilyBook.dependencies = AppContainer

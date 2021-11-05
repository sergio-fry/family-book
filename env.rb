require "dotenv"

ENV["APP_ENV"] ||= "production"

if ENV.fetch("APP_ENV") == "development"
  Dotenv.load(".env.services")
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

    logger = Logger.new(STDOUT)
    logger.level = ENV.fetch("LOGGER_LEVEL", "debug")

    logger
  end
end

require "family_book"
FamilyBook.dependencies = AppContainer

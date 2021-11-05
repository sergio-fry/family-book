require_relative "env"
require "family_book/web"

run FamilyBook::Web.freeze.app

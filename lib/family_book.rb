# frozen_string_literal: true

require_relative "family_book/version"
require "pathname"
require "dry-auto_inject"

module FamilyBook
  class Error < StandardError; end
  # Your code goes here...

  def self.root
    Pathname.new File.join(__dir__, "..")
  end

  def self.import
    Dry::AutoInject @@dependencies
  end

  def self.dependencies=(dependencies)
    @@dependencies = dependencies
  end
end

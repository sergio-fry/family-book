# frozen_string_literal: true

require_relative "family_book/version"
require "pathname"

module FamilyBook
  class Error < StandardError; end
  # Your code goes here...

  def self.root
    Pathname.new File.join(__dir__, "..")
  end
end

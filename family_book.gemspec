# frozen_string_literal: true

require_relative "lib/family_book/version"

Gem::Specification.new do |spec|
  spec.name          = "family_book"
  spec.version       = FamilyBook::VERSION
  spec.authors       = ["Sergei O. Udalov"]
  spec.email         = ["sergei.udalov@gmail.com"]

  spec.summary       = "Family book reader"
  spec.description   = "Ready shared book by all grand parrents to your children"
  spec.homepage      = "https://github.com/sergio-fry/family-book"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://rubgems.org'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sergio-fry/family-book"
  spec.metadata["changelog_uri"] = "https://github.com/sergio-fry/family-book/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end

# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc "DB migrate"
task "db:migrate" do
  require "sequel"
  Sequel.extension :migration

  db = Sequel.connect(ENV.fetch("DATABASE_URL"))
  Sequel::Migrator.run(db, FamilyBook.root.join("db/migrations"), use_transactions: true)
end

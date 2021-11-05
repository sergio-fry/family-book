require "sequel"
require "family_book/books"

module FamilyBook
  RSpec.describe Books do
    let(:books) { described_class.new(db) }
    let(:db) { Sequel.sqlite }
    before do
      Sequel.extension :migration
      Sequel::Migrator.run(db, FamilyBook.root.join("db/migrations"), use_transactions: true)
    end

    let(:book) { double(format: "epub") }

    context do
      before { books << book }
      it { expect(books.first.format).to eq "epub" }
    end
  end
end

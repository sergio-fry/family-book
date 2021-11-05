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

    let(:book) do
      double(
        :book,
        format: "epub",
        file_content: "123",
        position: 0
      )
    end

    context do
      before { books << book }

      describe "stored book" do
        let(:stored) { books.first }
        it { expect(stored.format).to eq "epub" }
        it { expect(stored.file_content).to eq "123" }
        it { expect(stored.position).to eq 0 }
      end
    end
  end
end

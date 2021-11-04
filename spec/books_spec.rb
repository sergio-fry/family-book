require "family_book/book"
require "family_book/books"
require "redis"

module FamilyBook
  RSpec.describe Books do
    let(:books) { described_class.new(db) }
    let(:db) { double(:db) }

    let(:book) { Book.new(file: double(:file)) }

    context do
      before { books << book }
      it { expect(books).to include book }
    end
  end
end

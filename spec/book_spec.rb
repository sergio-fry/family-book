require "family_book/book"
require "family_book/books"

module FamilyBook
  RSpec.describe Book do
    before { AppContainer.resolve(:db)[:books].truncate }
    let(:books) { Books.new }

    let(:book_attrs) { {format: "epub", file_content: "", position: ""} }
    let(:book) { books.create book_attrs }

    context do
      before { book.format = "fb2" }
      it { expect(book.format).to eq "fb2" }
    end

    context do
      before { book.file_content = "content" }
      it { expect(book.file_content).to eq "content" }
    end
  end
end

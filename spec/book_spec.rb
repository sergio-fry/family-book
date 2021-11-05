require "family_book/book"

module FamilyBook
  RSpec.describe Book do
    before { AppContainer.resolve(:db)[:books].truncate }

    let(:book) do
      described_class.new(
        id: 1,
        format: "epub",
        file_content: "123",
        position: "loc#1"
      )
    end


    context do
      before { book.save }
    end
  end
end

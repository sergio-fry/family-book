require "family_book/books"

module FamilyBook
  RSpec.describe Books do
    let(:books) { described_class.new }
    before { AppContainer.resolve(:db)[:books].truncate }

    describe "#create" do
      let(:book_attrs) do
        {
          format: "epub",
          file_content: "123",
          position: "loc#1"
        }
      end

      before { books.create book_attrs }

      describe "stored book" do
        let(:stored) { books.first }
        it { expect(stored.format).to eq "epub" }
        it { expect(stored.file_content).to eq "123" }
        it { expect(stored.position).to eq "loc#1" }
      end
    end
  end
end

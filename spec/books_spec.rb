require "sequel"
require "family_book/books"

module FamilyBook
  RSpec.describe Books do
    let(:books) { described_class.new }
    before { AppContainer.resolve(:db)[:books].truncate }

    let(:book) do
      double(
        :book,
        format: "epub",
        file_content: "123",
        position: "loc#1"
      )
    end

    context do
      before { books << book }

      describe "stored book" do
        let(:stored) { books.first }
        it { expect(stored.format).to eq "epub" }
        it { expect(stored.file_content).to eq "123" }
        it { expect(stored.position).to eq "loc#1" }
      end
    end
  end
end

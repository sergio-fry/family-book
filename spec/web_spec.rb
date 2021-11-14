require "family_book/web"
require "rack/test"

require "dry/container/stub"

module FamilyBook
  module Tests
    class FakeBooks
      def initialize(collection)
        @collection = collection
      end

      def current
        @collection.last
      end

      def each
        @collection.each do |el|
          yield el
        end
      end
    end
  end

  RSpec.describe Web do
    include Rack::Test::Methods

    def app
      Web
    end

    before do
      AppContainer.enable_stubs!
      AppContainer.stub(:books, books_repo)
    end

    let(:books_repo) { Tests::FakeBooks.new books }
    let(:books) { [book] }
    let(:book) { double(:book, id: 1) }

    context do
      before { get "/" }
      it { expect(last_response).to be_ok }
    end

    context do
      before { get "/new" }
      it { expect(last_response).to be_ok }
    end

    context do
      before { get "/books" }
      it { expect(last_response).to be_ok }
    end

    xcontext do
      before { get "/books/1.epub" }
      it { expect(last_response).to be_ok }
    end
  end
end

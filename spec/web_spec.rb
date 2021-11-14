require "family_book/web"
require "rack/test"

module FamilyBook
  RSpec.describe Web do
    include Rack::Test::Methods

    def app
      Web
    end

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
  end
end

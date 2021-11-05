require "roda"

require "family_book/books"
require "family_book/book"

module FamilyBook
  class Web < Roda
    plugin :render, {
      views: File.join(__dir__, "web/views")
    }

    route do |r|
      r.root do
        r.get do
          "hello!"
        end
      end

      r.get "new" do
        render("new", locals: {content: "hello, world"})
      end

      r.post "upload" do
        books = Books.new
        r.redirect "/books"
      end

      r.get "books" do
        books = Books.new
        render("books", locals: {books: books})
      end
    end
  end
end

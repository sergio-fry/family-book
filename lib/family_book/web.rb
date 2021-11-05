require "roda"
require "pry"

require "family_book/books"
require "family_book/book"

module FamilyBook
  class Web < Roda
    plugin :render, {
      views: File.join(__dir__, "web/views")
    }
    # plugin :static, ["static"], root: File.join(__dir__, "web/static")
    plugin :static, ["/node_modules", "/books"], root: FamilyBook.root

    route do |r|
      r.root do
        r.get do
          books = Books.new

          if books.current.nil?
            r.redirect "/new"
          else
            render("read", locals: { book: books.current } )
          end
        end
      end

      r.get "new" do
        render("new", locals: {content: "hello, world"})
      end

      r.post "upload" do
        books = Books.new
        books << Book.new(
          format: 'epub',
          file:  r.params['book']['file'][:tempfile],
        )
        r.redirect "/books"
      end

      r.get "books" do
        books = Books.new
        render("books", locals: {books: books})
      end

      r.get "epubs", Integer do |id|
        books = Books.new
        book books.find { |book| book.id == id }
        book.file_content
      end

    end
  end
end

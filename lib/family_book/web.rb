require "roda"
require "family_book/books"
require "family_book/book"

module FamilyBook
  class Web < Roda
    include FamilyBook.import["logger", "books"]

    plugin :render, {
      views: File.join(__dir__, "web/views")
    }
    # plugin :static, ["static"], root: File.join(__dir__, "web/static")
    plugin :static, ["/node_modules"], root: FamilyBook.root
    plugin :path_matchers
    plugin :json_parser

    route do |r|
      r.root do
        r.get do
          if books.current.nil?
            r.redirect "/new"
          else
            render("read", locals: {book: books.current})
          end
        end
      end

      r.get "new" do
        render("new", locals: {content: "hello, world"})
      end

      r.post "upload" do
        books.create(
          format: "epub",
          file_content: r.params["book"]["file"][:tempfile].read,
          position: ""
        )
        r.redirect "/books"
      end

      r.on "books" do
        r.on extension: "epub" do |id|
          r.get do
            book = books.find(id)

            book.file_content
          end
        end

        r.on Integer do |id|
          book = books.find(id)

          r.post "position" do
            book.position = r.params["position"]
            ""
          end
        end

        r.get do
          render("books", locals: {books: books})
        end
      end
    end
  end
end

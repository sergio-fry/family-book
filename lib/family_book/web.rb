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

      r.get "books" do
        render("books", locals: {books: books})
      end

      r.on "files" do
        r.on extension: "epub" do |id|
          r.get do
            book = books.find { |book| book.id == id.to_i }
            logger.debug book.file_content

            book.file_content
          end
        end
      end
    end
  end
end

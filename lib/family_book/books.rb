require "tempfile"
require "family_book/book"

module FamilyBook
  class Books
    include Enumerable
    include FamilyBook.import["db"]

    def each
      db[:books].each do |attrs|
        file = Tempfile.new("book_content")
        file.write attrs[:file_content]
        file.rewind

        yield Book.new(
          id: attrs[:id],
          format: attrs[:format],
          file: file,
          position: attrs[:position].to_i
        )
      end
    end

    def <<(book)
      db[:books].insert(
        format: book.format,
        file_content: Sequel.blob(book.file_content),
        position: book.position
      )
    end

    def current
      first
    end
  end
end

require "tempfile"
require "family_book/book"

module FamilyBook
  class Books
    include Enumerable

    def initialize(db)
      @db = db
    end

    def each
      @db[:books].each do |attrs|
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
      @db[:books].insert(
        format: book.format,
        file_content: book.file_content,
        position: book.position
      )
    end
  end
end

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
          position: attrs[:position]
        )
      end
    end

    def <<(book)
      create(
        format: book.format,
        file_content: book.file_content,
        position: book.position
      )
    end

    def create(attrs)
      db[:books].insert(
        format: attrs[:format],
        file_content: Sequel.blob(attrs[:file_content]),
        position: attrs[:position]
      )
    end

    def current
      first
    end
  end
end

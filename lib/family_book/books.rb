require "family_book/book"

module FamilyBook
  class Books
    include Enumerable

    def initialize(db)
      @db = db
    end

    def each
      @db[:books].each do |attrs|
        yield Book.new(
          id: attrs[:id],
          format: attrs[:format]
        )
      end
    end

    def <<(book)
      @db[:books].insert(
        format: book.format
      )
    end
  end
end

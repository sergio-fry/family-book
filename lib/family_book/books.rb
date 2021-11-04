module FamilyBook
  class Books
    include Enumerable

    def initialize(db)
      @db = db
      @books = []
    end

    def each
      @books.each do |book|
        yield book
      end
    end

    def <<(book)
      @books << book
    end
  end
end

require "tempfile"
require "family_book/book"

module FamilyBook
  class Books
    include Enumerable
    include FamilyBook.import["db"]

    def each
      db[:books].select(:id).each do |attrs|
        yield Book.new(attrs[:id])
      end
    end

    def create(attrs)
      id = db[:books].insert(
        format: attrs[:format],
        file_content: Sequel.blob(attrs[:file_content]),
        position: attrs[:position]
      )

      Book.new(id)
    end

    def current
      Book.new db[:books].order(:id).last[:id]
    end

    def find(id)
      Book.new id
    end
  end
end

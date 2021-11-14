require "pry"
module FamilyBook
  class Book
    include FamilyBook.import["db"]

    attr_reader :id

    def initialize(id, *args)
      super(*args)
      @id = id
    end

    def file_content=(new_value)
      db[:books].where(Sequel[:id] => @id).update(file_content: new_value)
    end

    def file_content
      db[:books].select(:format).where(id: @id).first[:file_content]
    end

    def format=(new_format)
      db[:books].where(Sequel[:id] => @id).update(format: new_format)
    end

    def format
      db[:books].select(:format).where(id: @id).first[:format]
    end

    def file_content
      content = nil

      Tempfile.create("book_content") do |file|
        file.write db[:books].select(:file_content).where(id: @id).first[:file_content]

        file.rewind

        content = file.read
      end

      content
    end

    def position
      db[:books].select(:position).where(id: @id).first[:position]
    end
  end
end

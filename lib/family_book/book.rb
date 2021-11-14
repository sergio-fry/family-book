require "pry"
module FamilyBook
  class Book
    include FamilyBook.import["db"]

    attr_reader :id

    def initialize(id, *args)
      super(*args)
      @id = id
    end

    def file_content=(value)
      write_attr :file_content, value
    end

    def file_content
      read_attr :file_content
    end

    def format=(value)
      write_attr :format, value
    end

    def format
      read_attr :format
    end

    def position=(value)
      write_attr :position, value
    end

    def position
      read_attr :position
    end

    private

    def read_attr(attr)
      db[:books].select(attr).where(id: @id).first[attr]
    end

    def write_attr(name, value)
      db[:books].where(id => @id).update(name => value)
    end
  end
end

module FamilyBook
  class Book
    attr_reader :id, :format, :position

    def initialize(format:, file:, id: nil, position: nil)
      @id = id
      @format = format
      @file = file
      @position = position
    end

    def file_content
      content = @file.read
      @file.rewind

      content
    end
  end
end

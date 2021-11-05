module FamilyBook
  class Book
    attr_reader :format, :position

    def initialize(id: nil, format:, file:, position: 0)
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

module FamilyBook
  class Book
    attr_reader :format

    def initialize(id: nil, format:)
      @id = id
      @format = format
    end
  end
end

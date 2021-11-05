require "roda"

module FamilyBook
  class Web < Roda
    route do |r|
      r.root do
        r.get do
          "hello!"
        end
      end
    end
  end
end

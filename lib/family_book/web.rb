require "roda"

module FamilyBook
  class Web < Roda
    plugin :render, {
      views: File.join(__dir__, "web/views")
    }

    route do |r|
      r.root do
        r.get do
          "hello!"
        end
      end

      r.get "new" do
        render("new", locals: {content: "hello, world"})
      end
    end
  end
end

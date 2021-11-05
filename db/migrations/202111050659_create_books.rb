Sequel.migration do
  up do
    create_table(:books) do
      primary_key :id
      String :format, null: false
      String :file_content, null: false
      String :position, null: false
    end
  end

  down do
    drop_table(:books)
  end
end

class CreateHeadersDictionaries < ActiveRecord::Migration[5.0]
  def change
    create_table :headers_dictionaries do |t|
      t.string :document_header
      t.string :db_column_name
      t.timestamps
    end
  end
end

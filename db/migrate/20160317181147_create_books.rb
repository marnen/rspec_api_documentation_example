class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :author_first_name, null: false
      t.string :author_last_name, null: false
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end

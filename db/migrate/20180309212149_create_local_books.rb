class CreateLocalBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :local_books do |t|
      t.string :google_id
      t.boolean :read
      t.integer :page_number

      t.timestamps
    end
  end
end

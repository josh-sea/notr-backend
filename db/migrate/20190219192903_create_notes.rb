class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :classroom_id

      t.timestamps
    end
  end
end

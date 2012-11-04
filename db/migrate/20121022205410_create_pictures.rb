class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :bookmark
      t.string :image
      t.string :note

      t.timestamps
    end

    add_index :pictures, :bookmark_id
  end
end

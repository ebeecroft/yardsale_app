class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :yardsale
      t.string :image
      t.string :note

      t.timestamps
    end

    add_index :pictures, :yardsale_id
  end
end

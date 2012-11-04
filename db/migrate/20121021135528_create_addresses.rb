class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user
      t.references :bookmark
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end

    add_index :addresses, :user_id
    add_index :addresses, :bookmark_id
  end
end

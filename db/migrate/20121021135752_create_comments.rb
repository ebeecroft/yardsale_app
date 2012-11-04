class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :bookmark
      t.text :comment

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :bookmark_id
    add_index :comments, [:user_id, :bookmark_id]
  end
end

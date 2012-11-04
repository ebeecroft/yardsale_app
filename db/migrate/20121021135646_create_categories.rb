class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :bookmark
      t.string :name

      t.timestamps
    end

    add_index :categories, :bookmark_id
  end
end

class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :yardsale
      t.string :name

      t.timestamps
    end

    add_index :categories, :yardsale_id
  end
end

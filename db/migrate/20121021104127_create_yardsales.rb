class CreateYardsales < ActiveRecord::Migration
  def change
    create_table :yardsales do |t|
      t.string :title
      t.date :date
      t.time :begin_time
      t.time :end_time
      t.text :description
      t.integer :user_id
      t.integer :address_id

      t.timestamps
    end
    
    add_index :yardsales, [:user_id, :created_at]
  end
end

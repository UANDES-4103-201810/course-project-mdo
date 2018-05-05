class CreatePromises < ActiveRecord::Migration[5.1]
  def change
    create_table :promises do |t|
      t.integer :price
      t.text :description
      t.date :release_date
      t.integer :quantity

      t.integer :project_id

      t.timestamps
    end
  end
end

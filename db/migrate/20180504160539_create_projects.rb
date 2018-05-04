class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.boolean :outstanding
      t.boolean :approved
      t.boolean :deleted
      t.string :title
      t.text :description
      t.integer :ammount
      t.integer :days_to_go
      t.string :picture
      t.string :video
      t.text :descriptive_page
      t.date :delivery_date

      t.timestamps
    end
  end
end

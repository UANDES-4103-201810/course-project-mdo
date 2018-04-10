class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.boolean :outstanding
      t.boolean :approved
      t.boolean :deleted
      t.string :title
      t.text :description
      t.integer :amount
      t.integer :days_to_go
      t.string :picture
      t.string :video
      t.text :descriptive_page
      t.date :delivery_date
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

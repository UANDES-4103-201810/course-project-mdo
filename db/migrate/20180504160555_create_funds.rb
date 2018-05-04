class CreateFunds < ActiveRecord::Migration[5.1]
  def change
    create_table :funds do |t|
      t.integer :money
      t.boolean :approved
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

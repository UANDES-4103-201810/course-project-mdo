class CreateBuys < ActiveRecord::Migration[5.1]
  def change
    create_table :buys do |t|
      t.boolean :approved
      t.references :promise, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

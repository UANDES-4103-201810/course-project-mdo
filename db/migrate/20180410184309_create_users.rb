class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :address
      t.string :name
      t.string :last_name
      t.string :image
      t.date :birth_date
      t.string :security_question
      t.string :security_answer
      t.datetime :last_login

      t.timestamps
    end
  end
end

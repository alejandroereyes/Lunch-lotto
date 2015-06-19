class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :network_circle
      t.string :linked_in
      t.string :twitter

      t.timestamps null: false
    end
  end
end

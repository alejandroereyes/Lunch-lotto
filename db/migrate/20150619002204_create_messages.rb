class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :event_id
      t.string :post
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

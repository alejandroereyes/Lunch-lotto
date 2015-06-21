class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :post
      t.string :event_id
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :match, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

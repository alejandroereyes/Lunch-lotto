class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string  :event_id
      t.integer :pair
      t.boolean :accept
      t.string  :day
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :match_id
      t.integer :pair
      t.boolean :accept, default: false
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.boolean :easy_breezy
      t.boolean :health_nut
      t.boolean :wild_child
      t.boolean :lux_lunch
      t.boolean :casual_sit_down
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

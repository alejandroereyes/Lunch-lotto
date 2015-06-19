class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.boolean :easy_breezy, default: false
      t.boolean :health_nut, default: false
      t.boolean :wild_child, default: false
      t.boolean :lux_lunch, default: false
      t.boolean :casual_sit_down, default: false
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

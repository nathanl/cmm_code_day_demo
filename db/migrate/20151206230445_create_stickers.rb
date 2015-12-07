class CreateStickers < ActiveRecord::Migration
  def change
    create_table :stickers do |t|
      t.string :color, null: false
      t.string :text, null: false
    end
  end
end

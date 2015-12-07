class DropStickers < ActiveRecord::Migration
  def change
    drop_table :stickers
  end
end

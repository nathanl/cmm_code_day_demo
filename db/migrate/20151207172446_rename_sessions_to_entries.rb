class RenameSessionsToEntries < ActiveRecord::Migration
  def change
    rename_table :sessions, :entries
  end
end

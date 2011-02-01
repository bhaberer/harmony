class AddNoteIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :note_id, :integer
  end

  def self.down
    remove_column :events, :note_id
  end
end

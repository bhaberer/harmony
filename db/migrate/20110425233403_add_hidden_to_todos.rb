class AddHiddenToTodos < ActiveRecord::Migration
  def self.up
    add_column :todos, :hidden, :boolean, :default => false
  end

  def self.down
    remove_column :todos, :hidden
  end
end

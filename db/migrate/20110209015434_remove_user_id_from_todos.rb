class RemoveUserIdFromTodos < ActiveRecord::Migration
  def self.up
    remove_column :todos, :user_id
  end

  def self.down
    add_column :todos, :user_id, :integer
  end
end

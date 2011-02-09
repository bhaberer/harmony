class AddTodoTypeToTodos < ActiveRecord::Migration
  def self.up
    add_column :todos, :todo_type, :string
  end

  def self.down
    remove_column :todos, :todo_type
  end
end

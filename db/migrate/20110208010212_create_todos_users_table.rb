class CreateTodosUsersTable < ActiveRecord::Migration
  def self.up
    create_table :todos_users, {:id => false} do |t|
      t.column :todo_id,   :integer,   :null => false
      t.column :user_id,   :integer,   :null => false
    end
  end

  def self.down
    drop_table :todos_users
  end

end

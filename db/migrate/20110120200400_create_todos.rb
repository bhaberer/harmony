class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.integer :user_id
      t.integer :account_id
      t.boolean :completed, :default => false
      t.string :task

      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end

class AddOptionsToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :todo_list_on, :boolean, :default => true
    add_column :accounts, :notes_on, :boolean, :default => true
    add_column :accounts, :public, :boolean, :default => false
  end

  def self.down
    remove_column :accounts, :public
    remove_column :accounts, :notes
    remove_column :accounts, :todos
  end
end

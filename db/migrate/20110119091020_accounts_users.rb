class AccountsUsers < ActiveRecord::Migration

  def self.up
    create_table :accounts_users, {:id => false} do |t|
      t.column :account_id,   :integer,   :null => false
      t.column :user_id,      :integer,   :null => false
    end
  end

  def self.down
    drop_table :accounts_users
  end

end

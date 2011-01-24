class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :user_id
      t.integer :account_id
      t.string :event_type

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end

class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name
      t.integer :user_id
      t.string :twitter
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end

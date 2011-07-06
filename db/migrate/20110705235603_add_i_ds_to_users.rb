class AddIDsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fb_id, :string
    add_column :users, :udid, :string
  end

  def self.down
    remove_column :users, :udid
    remove_column :users, :fb_id
  end
end

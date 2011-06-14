class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.datetime :estimated_arrival_at
      t.datetime :checked_in_at
      t.boolean :active, :default => true
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end

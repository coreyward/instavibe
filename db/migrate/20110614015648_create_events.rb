class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.references :spot,    :null => false
      t.references :creator,    :null => false
      t.datetime :starts_at, :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end

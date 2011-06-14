class CreateSpots < ActiveRecord::Migration
  def self.up
    create_table :spots do |t|
      t.string :url
      t.string :name
      t.text :description
      t.string :geolat
      t.string :geolong
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :spots
  end
end

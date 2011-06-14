# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Seed spots with real Gowalla API spot data

unless defined? Rails
  require 'yajl'
  require 'awesome_print'
  
  # mock
  class Rails
    def self.root
      '.'
    end
  end
  
  class Spot
    def self.create! hash
      ap hash
    end
  end
end

json = File.new("#{Rails.root}/lib/gowalla_spot_seed_data.json", 'r')
parser = Yajl::Parser.new
spots = parser.parse(json)

spots['spots'].each do |spot|
  Spot.create!({ 
    :url => spot['url'],
    :name => spot['name'],
    :description => spot['description'],
    :geolat => spot['lat'],
    :geolong => spot['lng'],
    :image_url => spot['image_url']
  })
end

class Spot < ActiveRecord::Base
  has_many :spots # but it doesn't matter
  
  before_validation :strip_domain_from_url
  
  validates :url, :presence => true
  validates :name, :presence => true
  # validates :description, :presence => true # a bunch of Gowalla spots don't have descriptions :(
  validates :geolat, :presence => true
  validates :geolong, :presence => true
  validates :image_url, :presence => true, :url => true
  
  def refresh_information
    # this will eventually be necessary to keep cached Gowalla data fresh
  end
  
private

  # It'd be bad form to include the domain name, y'know?
  def strip_domain_from_url
    self.url.sub! %r{^https?://(www\.)?gowalla\.com}, ''
  end
end

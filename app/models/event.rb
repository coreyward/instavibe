class Event < ActiveRecord::Base
  belongs_to :spot
  belongs_to :creator, :class_name => :user # created by a user
  has_many :users, :through => :plans
  
  validates :spot, :presence => true
  validates :creator, :presence => true
  validates :starts_at, :presence => true, :timeliness => {
    :after => lambda { DateTime.now },
    :before => lambda { 12.hours.from_now }
  }
end

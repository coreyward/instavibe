class User < ActiveRecord::Base
  has_many :events, :through => :plans
  
  validates :name, :presence => true
  validates :email, :uniqueness => true, :email => true, :presence => true
end

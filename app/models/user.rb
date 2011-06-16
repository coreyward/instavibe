class User < ActiveRecord::Base
  has_many :plans
  has_many :events, :foreign_key => 'creator_id'
  
  validates :name, :presence => true
  validates :email, :uniqueness => true, :email => true, :presence => true
end

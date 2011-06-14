class Plan < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  
  validates :event, :presence => true
  validates :user, :presence => true
  validates :estimated_arrival_at, :presence => true, :timeliness => {
    :on_or_after => lambda { |plan| plan.event.starts_at },
    :before => lambda { 12.hours.from_now }
  }
  
  scope :with_details, includes(:event => :spot)
  
  def checked_in?
    !checked_in_at.nil?
  end
  
  def running_late?
    estimated_arrival_at > DateTime.now
  end
  
  def cancelled?
    !active?
  end
end

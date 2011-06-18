class Plan < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  accepts_nested_attributes_for :event
  
  # todo: prevent conflicting plans
  validates :event, :presence => true
  validates :user, :presence => true
  validates :estimated_arrival_at, :presence => true, :timeliness => {
    :on_or_after => lambda { |plan| plan.event.starts_at },
    :before => lambda { 12.hours.from_now }
  }
  validates_associated :event, :on => :create
  
  default_scope where(:active => true)
  scope :with_details, includes(:event => :spot)
  scope :recent, lambda { where('estimated_arrival_at > ?', 30.minutes.ago ) }
  
  # eventually:
  # scope :relevant, lambda { is_in_the_future || is_checked_in }
  
  def check_in!
    return checked_in_at if checked_in?
    update_attribute(:checked_in_at, DateTime.now)
  end
  
  def checked_in?
    !checked_in_at.nil?
  end
  
  def running_late?
    (estimated_arrival_at < DateTime.now) && !checked_in?
  end
  
  def cancelled?
    !active?
  end
  
  def deactivate!
    update_attribute :active, false
  end
end

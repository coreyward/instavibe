class Plan < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  
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

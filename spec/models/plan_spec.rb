require 'spec_helper'

describe Plan do
  before :each do
    @user = mock_model(User)
    @event = mock_model(Event, :starts_at => 45.minutes.from_now, :save => true)
    
    @plan = Plan.new({ 
      :event => @event,
      :user => @user,
      :estimated_arrival_at => 1.hour.from_now
    })
  end
  
  it "should not be valid without attributes" do
    Plan.new.should_not be_valid
  end
  
  it "should require an event" do
    @plan.event = nil
    @plan.should_not be_valid
  end
  
  it "should require a user" do
    @plan.user = nil
    @plan.should_not be_valid
  end
  
  it "should belong_to a user" do
    @plan.user.should_not be_nil
  end
  
  it "should belong_to an event" do
    @plan.event.should_not be_nil
  end
  
  it "should require an estimated arrival time" do
    @plan.estimated_arrival_at = nil
    @plan.should_not be_valid
    @plan.errors.should include(:estimated_arrival_at)
  end
  
  it "verifies check-in state with checked_in?" do
    @plan.should_not be_checked_in
    @plan.checked_in_at = DateTime.now
    @plan.should be_checked_in
  end
  
  it "should not allow estimated arrival to be after 12 hours" do
    @plan.estimated_arrival_at = 13.hours.from_now
    @plan.should_not be_valid
  end
  
  it "should not allow estimated arrival to be before event start" do
    @plan.estimated_arrival_at = 40.minutes.from_now
    @plan.should_not be_valid
    @plan.errors.should include(:estimated_arrival_at)
  end
  
  it "should check a user in" do
    @plan.checked_in_at.should be_nil
    @plan.check_in!
    @plan.checked_in?.should be_true
  end
  
  it "should report when a plan is running behind schedule" do
    # verify state
    @plan.should_not be_running_late
    @plan.should_not be_checked_in
    
    @plan.estimated_arrival_at = 5.minutes.ago
    @plan.should be_running_late
  end
  
  it "should allow a plan to be deactivated" do
    @plan.should be_active
    @plan.deactivate!
    @plan.should_not be_active
  end
end
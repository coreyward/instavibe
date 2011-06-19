require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new(:name => 'Foo', :email => 'example@example.com')
    event = mock_model(Event, :spot_id => 1, :starts_at => DateTime.now, :description => 'Foobar', :save => true)
  end
  
  it do
    @user.should be_valid
  end
  
  it "should require a name" do
    @user.name = nil
    @user.should have(1).error_on(:name)
  end
  
  it "should require an email" do
    @user.email = nil
    @user.should have(2).errors_on(:email)
  end
  
  it "should not allow duplicate emails" do
    @user.dup.save
    @user.should_not be_valid
    @user.should have(1).error_on(:email)
  end
  
  it "should downcase email addresses before validation" do
    @user.email = 'JoHnSmiTh@eXaMpLe.CoM'
    @user.valid?
    @user.email.should == 'johnsmith@example.com'
  end
  
  it "should have many events"
end
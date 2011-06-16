class CheckinsController < ApplicationController
  respond_to :json, :xml
  before_filter :set_plan 
  
  def create
    # no post data needed
    @plan.check_in!
    respond_with(@user, @plan)
  end
  
private
  def set_plan
    @user = User.find(params[:user_id])
    @plan = @user.plans.find(params[:plan_id])
    # raise ActiveRecord::RecordNotFound unless @user && @plan
  end
end

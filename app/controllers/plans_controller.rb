class PlansController < ApplicationController
  respond_to :json, :xml
  before_filter :set_user
  
  # GET /api/users/:user_id/plans
  def index
    @plans = @user.plans.recent
    respond_with(@user, @plans)
  end

  # GET /api/users/:user_id/plans/1
  def show
    @plan = Plan.with_details.find(params[:id])
    respond_with(@user, @plan, :include => { :event => { :include => :spot } })
  end

  # POST /api/users/:user_id/plans
  def create
    @plan = @user.plans.create(params[:plan])
    respond_with(@user, @plan)
  end

  # PUT /api/users/:user_id/plans/:id
  def update
    @plan = @user.plans.unscoped.find(params[:id])
    @plan.update_attributes(params[:plan])
    respond_with(@user, @plan)
  end

  # DELETE /api/users/:user_id/plans/1
  def destroy
    @plan = @user.plans.find(params[:id])
    @plan.deactivate!
    head :ok
  end
  
private

  def set_user
    @user = User.find(params[:user_id])
  end
  
end

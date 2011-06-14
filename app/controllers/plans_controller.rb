class PlansController < ApplicationController
  respond_to :json
  before_filter :set_user
  
  # GET /plans
  # GET /plans.json
  def index
    @plans = @user.try(:plans)
    
    respond_with(@user, @plans)
  end

  # GET /plans/1
  def show
    @plan = Plan.with_details.find(params[:id])
    respond_with(@user, @plan, :include => { :event => { :include => :spot } })
  end

  # POST /plans
  def create
    @plan = @user.plans.create(params[:plan])
    respond_with(@user, @plan)
  end

  # PUT /plans/1
  # PUT /plans/1.json
  def update
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to(@plan, :notice => 'Plan was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to(plans_url) }
      format.json  { head :ok }
    end
  end
  
private

  def set_user
    @user = User.find(params[:user_id])
  end
  
end

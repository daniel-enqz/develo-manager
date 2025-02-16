class PlansController < ApplicationController
  def create
    @plan = Plan.new(plan_params)
    @floor = Floor.find(params[:floor_id])
    @plan.floor = @floor
    if @plan.save!
      redirect_to @floor.project
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @plan.update(plan_params)
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to project_path, notice: 'plan was successfully destroyed.'
  end

  private

  def plan_params
    params.require(:plan).permit(:stage)
  end

end

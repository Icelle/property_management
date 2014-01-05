class BuildingsController < ApplicationController
  include ApplicationHelper

  def new
    @building = Building.new
  end

  def show
    @building = Building.find(params[:id])
  end

  def create
    @building = Building.new(building_params)
    respond_to do |format|
      if @building.save
        format.html{redirect_to new_building_path, notice: "Building was successfully recorded."}
      else
        format.html {render action: 'new'}
      end
    end
  end

  def building_params
    params.require(:building).permit(:street, :city, :state, :postal_code, :description)
  end

end

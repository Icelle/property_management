class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def create
    @owner = Owner.new(owner_params)
    respond_to do |format|
      if @owner.save
        format.html{redirect_to new_owner_path, notice: "Owner was successfully recorded."}
      else
        format.html {render action: 'new'}
      end
    end
  end

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company_name)
  end
end

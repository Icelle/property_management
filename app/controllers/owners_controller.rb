class OwnersController < ApplicationController
  before_action :set_owner, only:[:show, :destroy]

  def new
    @owner = Owner.new
  end

  def show
  end

  def index
    @owners = Owner.all
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

  def destroy
    @owner.destroy
    respond_to do |format|
      if @owner.destroy
        format.html{redirect_to owners_path, notice: "Owner was successfully deleted."}
      else
        format.html {redirect_to owners_path, error: "Owner was not deleted."}
      end
    end
  end

private
  def set_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company_name)
  end
end

class AdminsController < ApplicationController
before_action :find_admin, only: [:show, :edit]
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      log_in(@admin)
      redirect_to @admin
    else
      render "new"
    end
  end

  def edit
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def index
  end

  private

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_admin
      @admin = Admin.find(params[:id])
  end

end

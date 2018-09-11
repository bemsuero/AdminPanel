class AdminsController < ApplicationController
before_action :find_admin, only: [:show, :edit, :update]
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

  def update
    if @admin.update(admin_params)
  p "User successfuly updated"
  redirect_to @admin
else
  render "edit"
end
end

  def show
    @admin = Admin.find(params[:id])
    @user = User.find_by(params[:user_id])
  end

  def index
  end

  private

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :photo, :password, :password_confirmation)
  end

  def find_admin
      @admin = Admin.find(params[:id])
  end

end

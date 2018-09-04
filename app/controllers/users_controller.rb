class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    @user.admin_id = current_admin.id
    @user.create_employee_id
    if @user.save
      msg = "New Employee Created: #{@user.full_name}."
      flash[:notice] = msg
      redirect_to instructors_index_path
      p @user.education
    else
      p @user.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
  p "User successfuly updated"
  redirect_to @user
else
  render "edit"
end
end

def destroy
  @user.destroy
  redirect_to instructors_index_path
end

  def index
    @users = User.where(admin_id: current_admin.id)
  end

  def show

  end



  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :birthdate, :salary, :education, :password, :password_confirmation)
  end

  def find_user
      @user = User.find(params[:id])
    end

end

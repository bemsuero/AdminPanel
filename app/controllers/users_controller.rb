class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
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
  redirect_to "/"
end

  def index
    @users = User.all
  end

  def show

  end

  private

  def user_params
    params.required(:user).permit(:first_name, :last_name, :email, :birthdate, :salary, :education, :password, :password_confirmation)
  end

  def find_user
      @user = User.find(params[:id])
    end

end

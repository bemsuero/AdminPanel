class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    @user.create_employee_id
    if @user.save
      msg = "New Employee Created: #{@user.full_name}."
      flash[:notice] = msg
      redirect_to @user
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
  respond_to do |format|
      format.js
    end
  @user.destroy
end

  def index
    @users = User.all
  end

  def show

  end

  def search
  end

  def results
    @results = params[:q]
    search_words = params[:q].downcase.split(' ')
    # you can chain methods with "enter" but why would you even do that.
    names = User.pluck(:first_name)
    matches = []
    @final_results = []
    search_words.each do |word|
      names.each do |na|
        if na.downcase.include?(word)
          matches << na
        end
        end
      end
      matches.each do |match|
        # Article.all.each do |article|
          x = User.where(first_name: match)
          x.each do |y|
            p @final_results
            @final_results << y
            p @final_results
          # end
      end
  end
end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :birthdate, :phone, :salary, :education, :photo, :password, :password_confirmation)
  end

  def find_user
      @user = User.find(params[:id])
    end

end

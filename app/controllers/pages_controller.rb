class PagesController < ApplicationController
  def show
    render "direct"
  end

  def direct
    if params[:user_type] == "Instructor"
      redirect_to "users/new"
    else
      redirect_to "students/new"
    end
  end

end

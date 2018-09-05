class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      u_log_in(user)
      redirect_to user
    else
      msg = "Invalid Credentials"
      p msg
    redirect_to root_path
    end
  end


  def destroy
    session[:user_id] = nil
    u_log_out if u_logged_in?
    p "logged out successfully"
    redirect_to root_path
  end


  def admincreate
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in(admin)
      redirect_to root_path
    else
      msg = "Invalid Credentials"
      p msg
      redirect_to adminlogin_path
    end
  end


  def admindestroy
    session[:admin_id] = nil
    log_out if logged_in?
    p "logged out successfully"
    redirect_to root_path
  end

end

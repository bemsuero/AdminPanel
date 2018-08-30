module SessionsHelper


def log_in(admin)
session[:admin_id] = admin.id
end

def current_admin
@current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
# set current_admin to the session of the current admin if it exists
end

def logged_in?
  !current_admin.nil?
   # this is calling the method of current_admin
end

def log_out
session.delete[:admin_id]
@current_admin = nil
# delete just deletes the session admin_id not the admin_id
end


#####################

def u_log_in(user)
session[:user_id] = user.id
end

def current_user
@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
# set current_user to the session of the current user if it exists
end

def u_logged_in?
  !current_user.nil?
   # this is calling the method of current_user
end

def u_log_out
session.delete[:user_id]
@current_user = nil
# delete just deletes the session admin_id not the admin_id
end

end

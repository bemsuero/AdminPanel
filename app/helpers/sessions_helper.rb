module SessionsHelper


def log_in(user)
session[:user_id] = user.id
end

def current_user
@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
# set current_user to the session of the current user if it exists
end

def logged_in?
  !current_user.nil?
   # this is calling the method of current_user
end

def log_out
session.delete[:user_id]
@current_user = nil
# delete just deletes the session user_id not the user_id
end

end

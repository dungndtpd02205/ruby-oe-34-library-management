module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def logged_in?
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    @current_user.present?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def admin?
    return @current_user.permission.eql? Settings.users.admin if logged_in?
  end
end

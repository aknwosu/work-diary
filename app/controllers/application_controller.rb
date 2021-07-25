class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_clock

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    redirect_to(login_path, alert: 'You must be signed in to access this page') if current_user.nil?
  end

  def current_clock
    @current_clock ||= current_user.work_logs.find_by(clock_out: nil)
  end
end

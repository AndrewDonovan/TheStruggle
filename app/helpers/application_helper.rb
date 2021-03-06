module ApplicationHelper

  def current_user
    @current_user ||= session[:remember_token] && Person.find(session[:remember_token]) rescue nil
  end

  def authenticate_user
    if !current_user
      redirect_to new_sessions_path
    end
  end

end

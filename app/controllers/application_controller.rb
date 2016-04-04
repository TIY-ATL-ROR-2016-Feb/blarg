class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    user_id = session[:user_id]
    if user_id
      User.find_by(id: user_id)
    end
#    user_id && User.find_by(id: user_id)
  end

  def authenticate!
    unless current_user
      flash[:notice] = "You must be logged in to do that."
      redirect_to :root
    end
  end
end

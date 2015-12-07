class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_signed_in?
    cookies.signed[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    return NullUser.new unless user_signed_in?
    User.find(cookies.signed[:user_id])
  end
end

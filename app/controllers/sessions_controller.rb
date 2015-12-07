class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      cookies.signed[:user_id] = user.id
      flash[:notice] = t("signed_in_welcome", email: user.email)
      redirect_to root_path
    else
      redirect_to "/sign_in"
    end
  end

  def destroy
    cookies.signed[:user_id] = nil
    redirect_to "/sign_in"
  end

end
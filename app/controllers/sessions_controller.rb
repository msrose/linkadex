class SessionsController < ApplicationController
  def new
    redirect_to root_url if signed_in?
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && user.verified?
      sign_in(user)
      self.current_user = user
      redirect_to root_url
    else
      flash[:error] = user && !user.verified? ? 'Please verify your account!' : 'Invalid email/password combination.'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end

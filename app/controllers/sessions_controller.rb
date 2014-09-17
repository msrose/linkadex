class SessionsController < ApplicationController
  def new
    redirect_to root_url if signed_in?
  end

  def create
    login = params[:session][:email_or_username].downcase
    user = User.find_by_email(login) || User.find_by_username(login)
    if user && user.authenticate(params[:session][:password]) && user.verified?
      sign_in(user)
      self.current_user = user
      redirect_to root_url
    else
      flash.now[:error] = user && !user.verified? ? 'Please verify your account!' : 'Invalid email/password combination.'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end

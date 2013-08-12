class UsersController < ApplicationController
  before_filter :get_action, :only => [:new, :create, :edit, :update]

  def new
    @action = 'Sign up'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.verification_email(@user, verify_users_url(:token => @user.verification_token)).deliver
      flash[:welcome] = 'Please verify your account to log in!'
      redirect_to signin_url
    else
      render :new
    end
  end

  def verify
    @user = User.find_by_verification_token(params[:token])
    if @user
      @user.verify!
    else
      redirect_to signin_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def get_action
      @action = params[:action] =~ /new|create/ ? 'Sign up' : 'Update info'
    end
end

class UsersController < ApplicationController
  before_filter :get_action, :only => [:new, :create, :edit, :update]
  before_filter :set_user, :only => :show
  before_filter :require_current_user, :only => [:edit, :update, :destroy]
  before_filter :require_not_signed_in, :only => [:new, :forgotten, :reset]

  def new
    @action = 'Sign up'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.verification_email(@user, verify_users_url(:token => @user.verification_token)).deliver
      flash[:info] = 'You have been sent an verification email: please read it to verfiy your account!'
      redirect_to signin_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    old_email = @user.email
    if @user.update_attributes(user_params)
      unless @user.email == old_email
        @user.unverify!
        sign_out
        UserMailer.verification_email(@user, verify_users_url(:token => @user.verification_token)).deliver
        flash[:info] = 'You must reverify your account. Please check your email.'
        redirect_to signin_path
      else
        flash[:success] = 'Account successfully updated.'
        redirect_to @user
      end
    else
      render :edit
    end
  end

  def show
    @groups = @user.groups.where(:private => false).includes(:links).order(:collapsed, :title)
  end

  def index
    @users = User.order(:name)
  end

  def verify
    @user = User.find_by_verification_token(params[:token])
    if @user
      @user.verify!
    else
      redirect_to signin_url
    end
  end

  def forgotten
  end

  def reset
    @user = User.find_by_email(params[:user][:email])
    if @user
      new_password = [('A'..'Z'), ('a'..'z'), (0..9)].map(&:to_a).flatten.sample(8).join
      @user.update_attributes(:password => new_password, :password_confirmation => new_password)
      UserMailer.forgotten_password(@user, new_password, signin_url).deliver
      flash[:info] = 'Password successfully reset. Please check your email.'
      redirect_to signin_url
    else
      flash.now[:error] = 'Sorry, that email is not associated with an account.'
      render :forgotten
    end
  end

  def destroy
    @user.destroy
    sign_out
    redirect_to signin_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :username)
    end

    def get_action
      @action = params[:action] =~ /new|create/ ? 'Sign up' : 'Update info'
    end

    def set_user
      @user = User.find_by_username(params[:username].downcase)
    end

    def require_current_user
      set_user
      redirect_to @user unless @user == current_user
    end

    def require_not_signed_in
      redirect_to current_user if signed_in?
    end
end

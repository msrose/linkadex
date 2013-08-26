class UsersController < ApplicationController
  before_filter :get_action, :only => [:new, :create, :edit, :update]
  before_filter :require_current_user, :only => [:edit, :update]

  def new
    @action = 'Sign up'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.verification_email(@user, verify_users_url(:token => @user.verification_token)).deliver
      flash[:welcome] = 'You have been sent an verification email: please read it to verfiy your account!'
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
        flash[:welcome] = 'You must reverify your account. Please check your email.'
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
    @user = User.find(params[:id])
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

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def get_action
      @action = params[:action] =~ /new|create/ ? 'Sign up' : 'Update info'
    end

    def require_current_user
      @user = User.find(params[:id])
      redirect_to @user unless @user == current_user
    end
end

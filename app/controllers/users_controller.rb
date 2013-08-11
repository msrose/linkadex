class UsersController < ApplicationController
  before_filter :get_action, :only => [:new, :create, :edit, :update]

  def new
    @action = 'Sign up'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render :new
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

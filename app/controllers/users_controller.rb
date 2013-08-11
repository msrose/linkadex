class UsersController < ApplicationController
  def new
    @action = 'Sign up'
    @user = User.new
  end
end

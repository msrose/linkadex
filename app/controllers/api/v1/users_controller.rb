module Api
  module V1
    class UsersController < ApplicationController
      def groups_with_links
        @user = User.find_by_username!(params[:username])
        render :json => @user
      end
    end
  end
end

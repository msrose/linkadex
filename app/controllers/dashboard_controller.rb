class DashboardController < ApplicationController
  def home
    @groups = Group.all
  end
end

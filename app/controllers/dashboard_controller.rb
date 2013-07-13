class DashboardController < ApplicationController
  def home
    @groups = Group.includes(:links).order(:collapsed, :title)
  end
end

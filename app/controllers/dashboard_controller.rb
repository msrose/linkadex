class DashboardController < ApplicationController
  def home
    @title = 'Dashboard - Linkage'
    @groups = Group.includes(:links).order(:collapsed, :title)
  end
end

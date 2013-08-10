class DashboardController < ApplicationController
  before_filter :load_groups

  def home
    @title = 'Dashboard - Linkage'
  end

  def feed
    render :json => @groups, :callback => params[:callback], :root => false
  end

  private

    def load_groups
      @groups = Group.includes(:links).order(:collapsed, :title)
    end
end

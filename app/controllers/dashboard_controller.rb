class DashboardController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :load_groups

  def home
    @title = 'Dashboard - Linkage'
  end

  def feed
    render :json => @groups, :callback => params[:callback], :root => false
  end

  private

    def load_groups
      @groups = current_user.groups.includes(:links).order(:collapsed, :title)
    end
end

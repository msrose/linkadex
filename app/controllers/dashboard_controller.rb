class DashboardController < ApplicationController
  before_filter :load_groups

  def home
    @title = 'Dashboard - Linkage'
  end

  def feed
    respond_to do |format|
      if params[:callback]
        format.json { render :json => @groups, :callback => params[:callback], :root => false }
      else
        format.json { render :json => @groups, :root => false }
      end
    end
  end

  private

    def load_groups
      @groups = Group.includes(:links).order(:collapsed, :title)
    end
end

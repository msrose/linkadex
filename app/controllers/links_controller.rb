class LinksController < ApplicationController
  before_filter :load_group
  before_filter :load_targets, :load_colors, :only => [:new, :edit, :create, :update]

  def new
    @link = @group.links.new
  end

  def edit
    @link = Link.find(params[:id])
  end

  def index
    @links = @group.links
  end

  private

    def load_group
      @group = Group.find(params[:group_id])
    end

    def load_targets
      @targets = %w(blank self)
    end
end

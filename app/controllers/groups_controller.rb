class GroupsController < ApplicationController
  before_filter :load_colors, :only => [:new, :edit]

  def new
    @group = Group.new
  end

  def create

  end

  def edit
    @group = Group.find(params[:id])
  end

  def update

  end

  def index
    @groups = Group.all
  end

  private

    def load_colors
      @colors = Color.all.collect { |color| [color.hex_value, color.id] }
    end
end

class GroupsController < ApplicationController
  before_filter :load_colors, :only => [:new, :edit, :create, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.color = Color.find(params[:group][:color])
    @group.save
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update

  end

  def index
    @groups = Group.all
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
  end

  private

    def group_params
      params.require(:group).permit(:title)
    end

    def load_colors
      @colors = Color.all.collect { |color| [color.hex_value, color.id] }
    end
end

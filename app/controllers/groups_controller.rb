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
    @group = Group.find(params[:id])
    @group.assign_attributes(group_params)
    @group.color = Color.find(params[:group][:color])
    @group.save
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
      params.require(:group).permit(:title, :collapsed)
    end

    def load_colors
      @colors = Color.all.collect { |color| [color.alias || color.hex_value, color.id] }
    end
end

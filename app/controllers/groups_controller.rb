class GroupsController < ApplicationController
  before_filter :load_colors, :only => [:new, :edit, :create, :update]
  before_filter :require_signed_in_user

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    @group.save
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end

  def update
    @group = current_user.groups.find(params[:id])
    @group.assign_attributes(group_params)
    @group.save
  end

  def index
    @title = 'Groups - Linkage'
    @groups = current_user.groups
  end

  def destroy
    @group = current_user.groups.find(params[:id])
    @group.destroy
  end

  private

    def group_params
      params.require(:group).permit(:title, :collapsed, :color_id, :order_rank)
    end
end

class GroupsController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :load_colors, :only => [:new, :edit, :create, :update]

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
    @group.clones.destroy_all if @group.private?
  end

  def index
    @title = 'Groups - Linkadex'
    @groups = current_user.groups
  end

  def destroy
    @group = current_user.groups.find(params[:id])
    @group.destroy
  end

  def clone_toggle
    @group = Group.find(params[:id])
    if !current_user.cloned_groups.include?(@group)
      Clone.create(:user_id => current_user.id, :group_id => @group.id) if !@group.private? && !current_user.groups.include?(@group)
    else
      Clone.find_by_user_id_and_group_id(current_user.id, @group.id).destroy
    end
  end

  private

    def group_params
      params.require(:group).permit(:title, :collapsed, :color_id, :order_rank, :private)
    end
end

class GroupsController < ApplicationController
  before_filter :load_colors, :only => [:new, :edit, :create, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.save
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.assign_attributes(group_params)
    @group.save
  end

  def index
    @title = 'Groups - Linkage'
    @groups = Group.all

    respond_to do |format|
      format.html
      if params[:callback]
        format.json { render :json => @groups, :callback => params[:callback], :root => false }
      else
        format.json { render :json => @groups, :root => false }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
  end

  private

    def group_params
      params.require(:group).permit(:title, :collapsed, :color_id, :order_rank)
    end
end

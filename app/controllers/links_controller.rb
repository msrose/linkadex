class LinksController < ApplicationController
  before_filter :load_group

  def index
    @links = @group.links
  end

  private

    def load_group
      @group = Group.find(params[:group_id])
    end
end

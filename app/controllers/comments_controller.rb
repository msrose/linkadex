class CommentsController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :find_group, :only => [:index, :create]
  before_filter :find_comment, :only => [:edit, :update, :destroy]

  def index
    @comments = @group.comments
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.group = @group
    @comment.save
  end

  def edit
  end

  def update
    @comment.update_attributes(comment_params)
  end

  def destroy
    @comment.destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_group
      @group = Group.find(params[:group_id])
    end

    def find_comment
      @comment = current_user.comments.find(params[:id])
    end
end

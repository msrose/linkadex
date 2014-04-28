class CommentsController < ApplicationController
  before_filter :require_signed_in_user
  before_filter :find_group
  before_filter :find_comment, :require_current_user, :only => [:edit, :update, :destroy]

  def index
    @comments = @group.comments
  end

  def create
    @comment = @group.comments.new(comment_params)
    @comment.user = current_user
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
      @comment = @group.comments.find(params[:id])
    end

    def require_current_user
      redirect_to root_url unless @comment.user == current_user
    end
end

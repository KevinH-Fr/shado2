class CommentsController < ApplicationController
  before_action :set_commentable

  def new
    @comment = Comment.new
  end

  def show
    @comment =  Comment.find(params[:id])
  end 

  def create
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      redirect_to @commentable unless @commentable.is_a?(Comment)
      redirect_to @commentable.find_top_parent if @commentable.is_a?(Comment)
      flash[:notice] = 'Comment created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to @commentable unless @commentable.is_a?(Comment)
      redirect_to @commentable.find_top_parent if @commentable.is_a?(Comment)
      flash[:notice] = 'Comment deleted'
    else
      redirect_to @commentable, alert: 'Something went wrong'
    end
  end


  private

  # not very nice, in my opinion
  def set_commentable
    if params[:post_id].present?
      @commentable = Post.find_by(id: params[:post_id])
    elsif params[:comment_id].present?
      @commentable = Comment.find_by(id: params[:comment_id])
    else
      # Handle the case when neither post_id nor comment_id is present
      render plain: "Invalid request: Missing post_id or comment_id", status: :unprocessable_entity
    end
  end
  

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end


end
class CommentsController < ApplicationController

  def create
    # @post = Post.find(params[:post_id])
    # @comment = current_user.comments.build(params.require(:comment).permit(:body))
    # @comment.post = @post
    # @topic = @post.topic
    # authorize @comment
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post

    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      #redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      #redirect_to [@topic, @post]
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    @new_comment = Comment.new
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:notice] = "Comment couldn't be deleted. Try again"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end

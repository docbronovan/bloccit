class SummariesController < ApplicationController
  def index
  end

  def new
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @summary = Summary.new
  end

  def show
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end

  def edit
  end

  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @summary = @post.build_summary(params.require(:summary).permit(:description))
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@topic,@post,@summary]
    else
      flash[:error] = "There was an error saving the Summary. Please try again."
    end
  end
end

class SummariesController < ApplicationController
  def index
  end

  def new
  end

  def show
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
  end

  def edit
  end
end

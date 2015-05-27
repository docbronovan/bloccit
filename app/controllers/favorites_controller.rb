class FavoritesController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite
    if favorite.save
      # Add code to generate a success flash and redirect to post
      flash[:notice] = "Post was favorited."
      redirect_to [post.topic, post]
    else
      # Add code to generate a failure flash and redirect to post
      flash[:notice] = "There was an error favoriting the post. Please try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorited(post)
    authorize favorite
    if favorite.destroy
      # Add code to generate a success flash and redirect to post
      flash[:notice] = "Post was unfavorited."
      redirect_to [post.topic, post]
    else
      # Add code to generate a failure flash and redirect to post
      flash[:notice] = "There was an error unfavoriting the post. Please try again."
      redirect_to [post.topic, post]
    end

  end


end

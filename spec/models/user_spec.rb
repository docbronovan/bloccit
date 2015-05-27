require 'rails_helper'

describe User do 
  
  include TestFactories

  describe "#favorited(post)" do

    #creating common objects in a before block
    before do
      @post = associated_post
      @user = authenticated_user
      @favorite = @post.favorites.where(user: @user).first
    end

    it "returns `nil` if the user has not favorited the post" do
      expect(@favorite).to eq nil
    end

    it "returns the appropriate favorite if it exists" do
      favorite = @post.favorites.create(user: @user)
      expect( @user.favorited(@post) ).to eq favorite
    end

    #confirm the favorited method returns nil if the user has favorited a different post than the post being passed into favorited
    it "returns `nil` if the user has favorited another post" do
      newPost = Post.create(user: @user, topic: Topic.last,title: 'My title here', body: 'My body here has to be pretty long huhuhuhuhu')
      newPost.save!
      newFavorite = newPost.favorites.create(user: @user)
      expect( @post.favorites.where(user: @user).first).to be_nil
    end
  end
end
require 'rails_helper'

describe User do 
  
  include TestFactories

  describe "#favorited(post)" do
    #creating common objects in a before block
    before do
      @post = associated_post
      @user = authenticated_user
      @favorite = @user.favorited(@post) 
    end

    it "returns `nil` if the user has not favorited the post" do
      expect(@favorite).to eq nil
    end

    it "returns the appropriate favorite if it exists" do
      @user.favorites.build(post: @post)
      expect( @user.favorited(@post) ).to eq true
    end

    #confirm the favorited method returns nil if the user has favorited a different post than the post being passed into favorited
    it "returns `nil` if the user has favorited another post" do
    end
  end

end
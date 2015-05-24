require 'rails_helper'
require 'rspec-rails'
describe Vote, type: :model do
  describe "validations" do 
    before do 
      @post = Post.create(title: 'post title', body: 'Post bodies must be pretty long.')
      3.times { @post.votes.create(value: 1) }
      2.times { @post.votes.create(value: -1) }
    end
    describe "value validations" do 
      it "only allows -1 or 1 as values" do 
        #your expectations here
        @post.votes.each do |vote|
          expect(vote.value).to eq(1).or eq(-1)
        end
      end
    end
  end
end

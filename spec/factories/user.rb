FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
 
    factory :user_with_post_and_comment do
      # @user1 = create(:user)
      # post = create(:post, user: @user1)
      # create(:comment, user: @user1, post: post)

      # @user2 = create(:user)
      # post = create(:post, user: @user2)
      # 2.times { create(:comment, user: @user2, post: post)}
      after :build do |user|
        post = create(:post, user: user)
        create(:comment, user: user, post: post)
      end
    end
    
  end
end
class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, length: {minimum: 2}, presence: true
  validates :user_id, presence: true
  
end

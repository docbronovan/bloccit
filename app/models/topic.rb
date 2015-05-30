class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  #Use the publicly_viewable scope inside of the visible_to scope to make your code more DRY.
  scope :visible_to, -> (user) { user ? all : publicly_viewable }
  
  # Define publicly_viewable and privately_viewable scopes on Topic that return collections of public or private topics.
  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { where(public: false) }

  def self.publicly_viewable
    where(public: true)
  end
end

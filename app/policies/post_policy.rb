class PostPolicy < ApplicationPolicy
    class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? OR user.moderator?
        scope.all
      elsif user.member?
        scope.where(:published => true)
      else
        scope.none
      end
    end
  end

  def update?
    user.admin? or not post.published?
  end

  def index?
    true
  end
end
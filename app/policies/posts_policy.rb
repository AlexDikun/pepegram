# app/policies/posts_policy.rb

class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @acc = account
    @post = post
  end

  def show?
    account.posts.where(id: post_id).exists?
  end

  def update?
    account.posts.where(id: post_id).exists?
  end

  def destroy?
    account.posts.where(id: post_id).exists?
  end
end

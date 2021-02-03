# app/policies/posts_policy.rb

class PostPolicy
  attr_reader :account, :post

  def initialize(account, post)
    @acc = account
    @post = post
  end

  def edit?
    @acc.posts.where(id: post.id).exists?
  end

  def update?
    @acc.posts.where(id: post.id).exists?
  end

  def destroy?
    @acc.posts.where(id: post.id).exists?
  end
end

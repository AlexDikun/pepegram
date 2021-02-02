# app/policies/posts_policy.rb

class PostPolicy
  attr_reader :account, :post

  def initialize(account, post)
    @acc = account
    @post = post
  end

  def edit?
    account.posts.where(id: post_id).exists?
  end

  def update?
    account.posts.where(id: post_id).exists?
  end

  def destroy?
    account.posts.where(id: post_id).exists?
  end
end

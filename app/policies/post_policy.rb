# app/policies/post_policy.rb
# frozen_string_literal: true

# top-level class documentation comment
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

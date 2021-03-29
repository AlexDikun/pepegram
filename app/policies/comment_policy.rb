# app/policies/comment_policy.rb
# frozen_string_literal: true

# top-level class documentation comment
class CommentPolicy
  attr_reader :account, :comment

  def initialize(account, comment)
    @acc = account
    @comment = comment
    @post = @comment.post
  end

  def destroy?
    (@comment.account == @acc) or (@post.account == @acc)
  end
end

# app/policies/comment_policy.rb

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

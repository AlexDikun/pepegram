# app/policies/account_policy.rb
# frozen_string_literal: true

# top-level class documentation comment
class AccountPolicy
  attr_reader :current_account, :account

  def initialize(current_account, account)
    @me = current_account
    @acc = account
  end

  def edit?
    @me.id == @acc.id
  end

  def update?
    @me.id == @acc.id
  end
end

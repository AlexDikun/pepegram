class FollowersController < ApplicationController
  def index
    @acc = Account.find(params[:account_id])
    @followings = @acc.followings
  end
end

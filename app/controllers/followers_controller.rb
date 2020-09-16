class FollowersController < ApplicationController
  def index
    @acc = Account.find(params[:account_id])
    @followers = @acc.followers
  end
end

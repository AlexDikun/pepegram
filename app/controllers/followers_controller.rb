# app/controllers/followers_controller.rb
# frozen_string_literal: true

# class describing the followers controller
class FollowersController < ApplicationController
  def index
    @acc = Account.find(params[:account_id])
    @followers = @acc.followers
  end
end

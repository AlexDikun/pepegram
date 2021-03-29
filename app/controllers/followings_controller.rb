# app/controllers/followings_controller.rb
# frozen_string_literal: true

# class describing the followings controller
class FollowingsController < ApplicationController
  def index
    @acc = Account.find(params[:account_id])
    @followings = @acc.followings
  end
end

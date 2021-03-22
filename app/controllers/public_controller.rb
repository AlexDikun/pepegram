# app/controllers/public_controller.rb
# frozen_string_literal: true

class PublicController < ApplicationController
  def home; end

  def help; end

  def about; end

  def contact; end

  def people
    @accounts = Account.all
  end
end

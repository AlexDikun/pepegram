# app/controllers/accounts_controller.rb
# frozen_string_literal: true

# class describing the acconuts controller
class AccountsController < ApplicationController
  include Pundit

  def show
    @acc = Account.find(params[:id])
  end

  def edit
    @acc = Account.find(params[:id])
    authorize @acc
  end

  def update
    @acc = Account.find(params[:id])
    authorize @acc
    if @acc.update(account_update_params)
      if @acc.avatar
        @acc.avatar_derivatives!
        @acc.save
      end
      redirect_to account_path(@acc)
    else
      render :edit
    end
  end

  private

  def account_update_params
    params.require(:account).permit(:username, :bio, :avatar)
  end

  def pundit_user
    current_account
  end
end

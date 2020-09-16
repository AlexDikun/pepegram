# app/controllers/accounts_controller.rb
# frozen_string_literal: true

class AccountsController < ApplicationController

  def show
    @acc = Account.find(params[:id])
  end

  def edit
    @acc = Account.find(params[:id])
  end

  def update
    @acc = Account.find(params[:id])
    if account.update(account_update_params)
     redirect_to account_path(@acc)
    else
      render :edit
    end
  end

  private

  def account_update_params
    params.require(:account).permit(:username)
  end
end

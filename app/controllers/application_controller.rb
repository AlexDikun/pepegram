class ApplicationController < ActionController::Base
  private

  def authentificate_account!
    if account_signed_in?
      super
    else
      redirect_to new_account_session_path
    end
  end

  def after_sign_in_path_for(account)
    account_post_path(account)
  end
end

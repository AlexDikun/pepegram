class ApplicationController < ActionController::Base

  def after_sign_in_path_for(account)
    account_posts_path(account)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end 

  private

  def authenticate_account!
    if account_signed_in?
      super
    else
      redirect_to new_account_session_path
    end
  end
end

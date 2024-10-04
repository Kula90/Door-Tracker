class ApplicationController < ActionController::Base
  # Redirects to the sign-in page after logout
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end

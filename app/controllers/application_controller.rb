class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    user_sites_path(current_user) # path User will be redirected to on login
  end
end

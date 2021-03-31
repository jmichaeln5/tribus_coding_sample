class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @sites = current_user.sites.order("created_at DESC")
  end

end

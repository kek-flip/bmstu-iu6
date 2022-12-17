class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :require_login

  def require_login
    redirect_to sessions_login_path unless signed_in?
  end
end

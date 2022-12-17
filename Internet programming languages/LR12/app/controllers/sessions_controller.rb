# frozen_string_literal: true

# SessionsController
class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[login create]

  def login; end

  def create
    user = User.find_by_login(params[:login])
    if user&.authenticate(params[:password])
      sign_in user
      redirect_to root_path
    else
      flash[:alert] = user.nil? ? 'Неправильный логин' : 'Неправильный пароль'
      redirect_to sessions_login_path
    end
  end

  def logout
    sign_out
    redirect_to sessions_login_path
  end
end

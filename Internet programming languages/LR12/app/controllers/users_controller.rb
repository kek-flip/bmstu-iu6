# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[create new edit]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    sign_in @user
    respond_to do |format|
      if @user.save
        format.html { redirect_to sessions_login_path, notice: 'User was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end
end

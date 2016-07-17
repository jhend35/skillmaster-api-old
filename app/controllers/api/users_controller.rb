class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      log_in!(@user)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      log_in!(@user)
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    render :show
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :password,
      :session_token,
      :bio,
      :fname,
      :lname,
      :email,
      :points
    )
  end

end

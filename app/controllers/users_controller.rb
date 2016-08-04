class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    #registration form
  end

  def create
    #post route for creating user
  end

  def destroy
    #delete user
  end

  private
  def user_params
    params.require(:game).permit(:user_throw)
  end
end

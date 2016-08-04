class UsersController < ApplicationController
before_filter :require_login, :except => [:new, :create]

  def show
    @user = User.find(params[:id])
    @schedule = Schedule.last
    @week1 = Day.all.limit(5)
    @week2 = Day.all.limit(5).offset(5)
    @week3 = Day.all.limit(5).offset(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
      session[:user_id] = @user.id
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find([params:id])
    @user.destroy

    #WHERE SHOULD THIS REDIRECT TO?
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end

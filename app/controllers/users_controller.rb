class UsersController < ApplicationController
before_filter :require_login, :except => [:new, :create]

  def show
    @user = User.find(params[:id])
    @schedule = Schedule.last
    user_selections = @user.selections.where(schedule_id: @schedule.id)
    @ordered_selections = user_selections.map {|sel| sel}.sort {|a, b| a.day.id <=> b.day.id}
    @week = Day.all.limit(5)
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

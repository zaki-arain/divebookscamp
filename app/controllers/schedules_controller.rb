class SchedulesController < ApplicationController
skip_before_action :verify_authenticity_token, :only => [:new]

  def show
    @schedule = Schedule.last
    render 'show'
  end

  def select_users
    @users ||= User.all
    @draftlist = @users
    render 'drafts/select_users'
  end

  def new
    @schedule = Schedule.create(start_date: params[:start_date])
    @users = []
    params[:users].each do |value|
      @users << User.find(value.to_i)
    end
    @users.shuffle!
    @users2 = @users + @users.reverse
    render 'schedules/new'
  end

  # def post



end

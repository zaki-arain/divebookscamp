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
    @snaked_users = @users + @users.reverse
    @drafters = []
    @snaked_users.each do |user|
      @drafters << Drafter.create(user_id: user.id, schedule_id: @schedule.id)
    end


    redirect_to new_draft_path(@schedule)
  end

  def edit

  end

  def draft
    @schedule = Schedule.find(params[:schedule_id])
    if @schedule.drafters[0].user_id == current_user.id
      p "current drafter -=-=-=-=-=0-=0-=0=-0=-=--=0=0"
      render 'schedules/_links_show'

    else
      p "NONOTNOTNOTNOTTNOcurrent drafter -=-=-=-=-=0-=0-=0=-0=-=--=0=0"

      render 'schedules/_no_links_show'
    end
  end


end

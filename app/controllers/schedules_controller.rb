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
    @schedule = Schedule.find(params[:schedule_id])
    @selection = Selection.create!(user_id: session[:user_id], schedule_id: @schedule.id, task_id: params[:id_to_update])
    @schedule = Schedule.find(params[:schedule_id])

    p "----- in edit"
    if request.xhr?
      render 'schedules/_links_show', layout: false, locals: {schedule: @schedule}
    else
      "booo"
    end
  end

  def draft
    @schedule = Schedule.find(params[:schedule_id])
    if @schedule.drafters[0] && @schedule.drafters[0].user_id == current_user.id
      p "current drafter -=-=-=-=-=0-=0-=0=-0=-=--=0=0"
      render 'schedules/edit'

    else
      p "NONOTNOTNOTNOTTNOcurrent drafter -=-=-=-=-=0-=0-=0=-0=-=--=0=0"

      render 'schedules/edit_no_links'
    end
  end


end

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
    current_drafter = @schedule.drafters[0]

    p "----- in edit"
    if request.xhr?
      Drafter.create(user_id: current_drafter.user.id, schedule_id: @schedule.id)
      current_drafter.destroy
      render 'schedules/_no_links_show', layout: false, locals: {schedule: @schedule}
    else
      "booo"
    end
  end

  def draft
    @schedule = Schedule.find(params[:schedule_id])
    current_drafter = @schedule.drafters[0]
    p "------ in draft route---"
    p current_drafter
    if current_drafter.user_id == current_user.id
      p "current drafter -=-=-=-=-=0-=0-=0=-0=-=--=0=0"
      Drafter.create(user_id: current_drafter.user.id, schedule_id: @schedule.id)
      current_drafter.destroy
      render 'schedules/edit'

    else
      p "NONOTNOTNOTNOTTNOcurrent drafter -=-=-=-=-=0-=0-=0=-0=-=--=0=0"

      render 'schedules/edit_no_links'
    end
  end


end

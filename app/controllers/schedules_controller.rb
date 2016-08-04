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
    p params.inspect
    @users = []
    params[:users].each do |value|
      p "---"
      p "#{value}"
      @users << User.find(value.to_i)
    end
    p "-------------users----------"
      p @users
  end



end

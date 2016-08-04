class SchedulesController < ApplicationController

  def show
    @schedule = Schedule.last
    redirect_to '/schedules/show'
  end


end

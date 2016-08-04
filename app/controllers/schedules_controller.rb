class SchedulesController < ApplicationController

  def show
    @schedule = Schedule.last
    render 'show'
  end


end

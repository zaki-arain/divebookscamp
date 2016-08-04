class SchedulesController < ApplicationController

  def show
    @schedule = Schedule.last
  end


end

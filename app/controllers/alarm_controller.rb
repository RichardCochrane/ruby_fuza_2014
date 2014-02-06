class AlarmController < ApplicationController

  def index
    @alarms = Alarm.all
  end

end

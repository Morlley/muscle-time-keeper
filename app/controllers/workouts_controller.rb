class WorkoutsController < ApplicationController
  def index
    get_two_week
  end

  private

  def get_two_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']
    @todays_date = Date.today
    @two_week_days = []

    14.times do |x|
      wday_num = (@todays_date -10 + x).wday
      if wday_num > 7
        wday_num -= 7
      end
      days = { month: (@todays_date -10 + x).month, date: (@todays_date -10 + x).day, wday: wdays[wday_num]}
      @two_week_days.push(days)
    end
  end
end

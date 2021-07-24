class WorkoutsController < ApplicationController

  def index
    get_calendar
  end

  private

  def set_date
    i = 74
    @today_date = Date.today.months_ago(i)
    @beginning_date = @today_date.beginning_of_month
    @end_date = @today_date.end_of_month
  end

  def get_this_month_days
    this_month_days_count = @end_date.day
    @this_month_days = []
    this_month_days_count.times do |x|
      day = @beginning_date + x 
      @this_month_days.push(day)
    end
  end

  def get_pre_days
    pre_days_count = @beginning_date.wday
    @pre_days = []
    pre_days_count.times do |x|
      pre_day = @beginning_date - @beginning_date.wday + x
      @pre_days.push(pre_day)
    end
  end

  def get_post_days
    post_days_count = 6 - @end_date.wday
    @post_days = []
    post_days_count.times do |x|
      post_day = @end_date + 1 + x
      @post_days.push(post_day)
    end
  end

  def get_calendar
    set_date
    get_this_month_days
    get_pre_days
    get_post_days

    @calendar = @pre_days + @this_month_days + @post_days
  end

end

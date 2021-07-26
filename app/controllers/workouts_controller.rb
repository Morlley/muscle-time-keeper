class WorkoutsController < ApplicationController

  def index
    set_date
    get_calendar
  end

  private

  def set_date
    if params[:monthNum].present?
      @month_num = params[:monthNum].to_i
    else
      @month_num = 0
    end

    @date = Date.today.advance(months: @month_num)
    @beginning_date = @date.beginning_of_month
    @end_date = @date.end_of_month
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
    get_this_month_days
    get_pre_days
    get_post_days

    @calendar = @pre_days + @this_month_days + @post_days
  end

end

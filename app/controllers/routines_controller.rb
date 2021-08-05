class RoutinesController < ApplicationController
  def new
    @routine = Routine.new
  end

  def confirm
    @routine = Routine.new(routine_params)
    if @routine.valid?
      # next_routineのset_countとrestをActiveHashのidからnameの値に変える
      modify_active_hash
    else
      render :new
    end
  end
  
  def create
    @routine  = Routine.new(routine_params)
    if params[:back]
      render :new
    else
      @routine.save
    end
  end

  def edit
    
  end

  def update

  end

  private

  def routine_params
    params.require(:routine).permit(:name, :menu, :set_count_id, :rest_id, next_routines_attributes: [:menu, :set_count_id, :rest_id, :routine_id, :_destroy]).merge(user_id: current_user.id)
  end

  def modify_active_hash
    next_routines_before = params[:routine][:next_routines_attributes]
    if next_routines_before.present?
      # confirm画面に渡すnext_routine空の配列を作成
      @next_routines = []
      next_routines_before.each do |next_routine|
        @next_routine = next_routine[1]
        # set_countをActiveHashのidからnameの値に変える
        modify_set_count
        # restをActiveHashのidからnameの値に変える
        modify_rest
        @next_routines.push(@next_routine)
      end
    end
  end

  def modify_set_count
    set_count_id = @next_routine[:set_count_id]
    set_count = set_count_id.to_i - 1
    @next_routine[:set_count_id] = set_count
  end

  def modify_rest
    rest_id = @next_routine[:rest_id]

    case rest_id
    when "2"
      rest = "15秒"
    when "3"
      rest = "30秒"
    when "4"
      rest = "45秒"
    when "5"
      rest = "1分"
    when "6"
      rest = "1分30秒"
    when "7"
      rest = "2分"
    when "8"
      rest = "2分30秒"
    when "9"
      rest = "3分"
    end
    
    @next_routine[:rest_id] = rest
  end

end

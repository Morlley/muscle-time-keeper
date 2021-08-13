class RoutinesController < ApplicationController
  before_action :set_routine, only: [:edit, :update, :destroy]
  before_action :move_to_index_edit, only: [:edit, :update, :destroy]

  def index
    move_to_index
    @routines = Routine.where(user_id: params[:user_id]).order("created_at DESC")
  end

  def new
    @routine = Routine.new
  end

  def confirm
    @routine = Routine.new(routine_params)
    if @routine.valid?
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
    if @routine.update(edit_routine_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @routine.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def set_routine
    @routine = Routine.find(params[:id])
  end

  def move_to_index
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
    end
  end

  def move_to_index_edit
    if current_user.id != @routine.user.id
      redirect_to root_path
    end
  end


  def routine_params
    params.require(:routine).permit(:name, :workout_time_id, :menu, :set_count_id, :rest_id, :status_id, next_routines_attributes: [:menu, :workout_time_id, :set_count_id, :rest_id, :routine_id, :_destroy]).merge(user_id: current_user.id, having_user_id: current_user.id)
  end

  def edit_routine_params
    params.require(:routine).permit(:name, :workout_time_id, :menu, :set_count_id, :rest_id, next_routines_attributes: [:menu, :workout_time_id, :set_count_id, :rest_id, :routine_id, :_destroy, :id]).merge(user_id: current_user.id)
  end

end

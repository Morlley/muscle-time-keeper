class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :download, :edit, :update, :destroy]
  before_action :move_to_root_edit, only: [:edit, :update, :destroy]
  before_action :move_to_root_download, only: [:show, :download]
  before_action :set_q, only: :search

  def index
    move_to_root
    @routines = Routine.where(having_user_id: params[:user_id]).order("created_at DESC")
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
      redirect_to user_path(current_user.id)
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

  def show
  end

  def download
    Routine.new(download_routine_params).save
    redirect_to user_path(current_user.id)
  end

  def search
    @results = @q.result.where(status_id: 1).where.not(user_id: current_user.id).includes(:likes).order("created_at DESC").uniq
  end

  private

  def set_routine
    @routine = Routine.find(params[:id])
  end

  def set_q
    @q = Routine.ransack(params[:q])
  end

  def move_to_root
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
    end
  end

  def move_to_root_edit
    if current_user.id != @routine.having_user_id
      redirect_to root_path
    end
  end

  def move_to_root_download
    if current_user.id == @routine.user.id || @routine.status_id == 2
      redirect_to root_path
    end
  end


  def routine_params
    params.require(:routine).permit(:name, :workout_time_id, :menu, :set_count_id, :rest_id, :status_id, next_routines_attributes: [:menu, :workout_time_id, :set_count_id, :rest_id, :routine_id, :_destroy]).merge(user_id: current_user.id, having_user_id: current_user.id)
  end

  def edit_routine_params
    params.require(:routine).permit(:name, :workout_time_id, :menu, :set_count_id, :rest_id, :status_id, next_routines_attributes: [:menu, :workout_time_id, :set_count_id, :rest_id, :routine_id, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def download_routine_params
    params.require(:routine).permit(:name, :workout_time_id, :menu, :set_count_id, :rest_id, next_routines_attributes: [:menu, :workout_time_id, :set_count_id, :rest_id, :routine_id, :_destroy]).merge(user_id: @routine.user.id, having_user_id: current_user.id, status_id: 2)
  end

end

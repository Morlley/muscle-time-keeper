class RoutinesController < ApplicationController
  def new
    @routine = Routine.new
  end

  def confirm

  end
  
  def create
    @routine  = Routine.new(routine_params)
    if @routine.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:menu, :set_count_id, :rest_id, next_routines_attributes: [:menu, :set_count_id, :rest_id, :routine_id, :_destroy]).merge(user_id: current_user.id)
  end
end

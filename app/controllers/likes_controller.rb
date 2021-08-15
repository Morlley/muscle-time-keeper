class LikesController < ApplicationController
  before_action :set_routine

  def create
    Like.create(user_id: current_user.id, routine_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, routine_id: params[:id]).destroy
  end

  private

  def set_routine
    @routine = Routine.find(params[:id])
  end
end

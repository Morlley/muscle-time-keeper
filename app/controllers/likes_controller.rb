class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, routine_id: params[:id])
    redirect_to routine_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, routine_id: params[:id]).destroy
    redirect_to routine_path
  end
end

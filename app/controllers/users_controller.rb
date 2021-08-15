class UsersController < ApplicationController
  before_action :move_to_index

  def show
    @routines = Routine.where(having_user_id: params[:id]).order("created_at DESC").includes(:next_routines)
  end

  def me
    @birthday = @user.birthday
  end

  private
  
  def move_to_index
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end
end

class UsersController < ApplicationController
  def show
  end

  def me
    @user = User.find(params[:id])
    @birthday = @user.birthday
  end
end

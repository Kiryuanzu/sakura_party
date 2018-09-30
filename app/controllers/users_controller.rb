class UsersController < ApplicationController
  def admin
    return root_url unless current_user.admin == true
    @user = User.order("created_at DESC")
  end

  def show
    @user = User.find(params[:id])
    @user_attends = @user.attends
  end
end

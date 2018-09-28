class UsersController < ApplicationController
  def admin
    return root_url unless current_user.admin == true
    @user = User.order("created_at DESC")
  end

end

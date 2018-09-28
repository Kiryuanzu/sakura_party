class AttendsController < ApplicationController
  def new 
    @attend = Attend.new
  end

  def create
    @attend = Attend.create(attend_params)
  end

  def destroy
    attend = Attend.find(params[:id])
    if attend.user_id == current_user.id
      attend.destroy
      redirect_to root_url
    end
  end

  private

  def attend_params
    params.require(:attend).permit(:comment,:mind).merge(user_id: current_user.id)
  end
end

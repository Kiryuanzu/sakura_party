class AttendsController < ApplicationController
  def create
    @attend = Attend.create(attend_params)
  end

  def destroy
    @attend = Attend.find(params[:id])
    @attend.destroy
    redirect_to root_url
  end

  private

  def attend_params
    params.require(:attend).permit(:comment, :mind, :event_id).merge(user_id: current_user.id)
  end
end

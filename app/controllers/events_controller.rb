class EventsController < ApplicationController
  def index
    @event = Event.includes(:user).order("created_at DESC")
    @attend = Attend.new
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def new
    return root_url unless current_user.organizer == true
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
  end

  def destroy
    if current_user.organizer == true
    event = Event.find(params[:id])
    event.destroy
  end

  private
  def event_params
    params.require(:event).permit(:name,:context,:started_date).merge(user_id: current_user.id)
  end
end

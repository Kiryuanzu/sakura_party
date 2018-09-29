class EventsController < ApplicationController
  def index
    @events = Event.includes(:user).order("created_at DESC")
  end

  def show
    @event = Event.find(params[:id])
    @attends = @event.attends
    @user_attend = Attend.find_by(user_id: current_user.id)
    @attend = Attend.new
    @attend.event_id = @event.id
  end
  
  def new
    return root_url unless current_user.organaizer == true
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    redirect_to root_url
  end

  def destroy
    if current_user.organizer?
      event = Event.find(params[:id])
      event.destroy
    end
  end

  private
  def event_params
    params.require(:event).permit(:name,:context,:started_date).merge(user_id: current_user.id)
  end
end

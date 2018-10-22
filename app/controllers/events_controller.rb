class EventsController < ApplicationController
  before_action :authenticate, only: [:show]
  def index
    @events = Event.includes(:user).order("started_date DESC").page(params[:page]).per(5)
  end

  def show
    @event = Event.find(params[:id])
    @attends = @event.attends
    @user_attend = Attend.find_by(user_id: current_user.id, event: @event.id)
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
    event = Event.find(params[:id])
    event.destroy
    redirect_to root_url
  end

  def edit
    @event = Event.find(params[:id])
    redirect_to root_url if current_user != @event.user
  end

  def update
    event = Event.find(params[:id])
      render 'edit' if current_user != event.user

      if event.update!(event_params)
        redirect_to root_url
      else 
        render 'edit'
      end
  end

  def secret
  end

  private
  def event_params
    params.require(:event).permit(:name,:context,:started_date,:place,:contact).merge(user_id: current_user.id)
  end
end

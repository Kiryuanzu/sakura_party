class AttendsController < ApplicationController
  def create
    @attend = Attend.create(attend_params)
    if Rails.env == 'production'
      notifier = Slack::Notifier.new(Rails.application.config.slack_webhook_url)
      message = @attend.user.user_name.to_s + "さんが「" + @attend.event.name.to_s + "」の参加を表明しました。現在のパーティ参加者は" + @event.event.attends.size.to_s + "人です。"
      notifier.ping(message)
    end
  end

  def destroy
    @attend = Attend.find(params[:id])
    if Rails.env == 'production'
      notifier = Slack::Notifier.new(Rails.application.config.slack_webhook_url)
      @numbers = @attend.event.attends.size - 1 
      message = @attend.user.user_name.to_s + "さんが「" + @attend.event.name + "」の参加をキャンセルしました。現在のパーティ参加者は" + @numbers.to_s + "人です。"
      notifier.ping(message)   
    end
    @attend.destroy
    redirect_to root_url
  end

  private

  def attend_params
    params.require(:attend).permit(:comment, :mind, :event_id).merge(user_id: current_user.id)
  end
end

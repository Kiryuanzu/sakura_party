class Attend < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def attend_up_count
    notifier = Slack::Notifier.new(Rails.application.config.slack_webhook_url)
    message = self.user.user_name.to_s + "さんが「" + self.event.name.to_s + "」の参加を表明しました。現在のパーティ参加者は" + self.event.attends.size.to_s + "人です。"
    notifier.ping(message)
  end

  def attend_down_count
      notifier = Slack::Notifier.new(Rails.application.config.slack_webhook_url)
      @numbers = @attend.event.attends.size - 1 
      message = @attend.user.user_name.to_s + "さんが「" + @attend.event.name + "」の参加をキャンセルしました。現在のパーティ参加者は" + @numbers.to_s + "人です。"
      notifier.ping(message)      
  end
end

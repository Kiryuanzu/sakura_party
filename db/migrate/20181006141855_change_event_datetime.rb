class ChangeEventDatetime < ActiveRecord::Migration[5.1]
  def up
    change_column :events, :started_date, :datetime
  end

  # 変更前の状態
  def down
    change_column :events, :started_date, :date
  end
end

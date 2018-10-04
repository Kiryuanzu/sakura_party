class ChangeEventsContext < ActiveRecord::Migration[5.1]
  def change
     def up
    change_column :events, :context, :text
  end

  # 変更前の状態
  def down
    change_column :events, :context, :string
  end
  end
end

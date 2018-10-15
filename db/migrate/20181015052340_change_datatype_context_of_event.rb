class ChangeDatatypeContextOfEvent < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :context, :text
  end
end

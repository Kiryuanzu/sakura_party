class CreateAttends < ActiveRecord::Migration[5.1]
  def change
    create_table :attends do |t|
      t.string :user_id, index: true
      t.string :comment
      t.string :mind, default: "参加予定"
      t.timestamps
    end
  end
end

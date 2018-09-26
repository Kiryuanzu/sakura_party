class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :user_id, index: true
      t.string :name
      t.string :context
      t.date :started_date
      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :user_id, index: true
      t.string :event_id, index: true
      t.string :text
      t.timestamps
    end
  end
end

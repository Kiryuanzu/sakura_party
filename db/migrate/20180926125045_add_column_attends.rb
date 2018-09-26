class AddColumnAttends < ActiveRecord::Migration[5.1]
  def change
    add_column :attends, :event_id, :string, index: true
  end
end

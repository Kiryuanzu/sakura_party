class AddCapacityToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :capacity, :integer, default: 20
  end
end

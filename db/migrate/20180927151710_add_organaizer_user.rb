class AddOrganaizerUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :organaizer, :boolean, default: false
  end
end

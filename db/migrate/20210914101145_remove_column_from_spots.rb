class RemoveColumnFromSpots < ActiveRecord::Migration[5.2]
  def change
    remove_column :spots, :price
    remove_column :spots, :is_active
  end
end

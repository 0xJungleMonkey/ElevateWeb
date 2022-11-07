class DroppingId < ActiveRecord::Migration[5.2]
  def change
    remove_column :batteries, :buildingid, :string
  end
end

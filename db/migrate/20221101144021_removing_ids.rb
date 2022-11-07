class RemovingIds < ActiveRecord::Migration[5.2]
  def change
    remove_column :batteries, :employeeid, :string
    remove_column :building_details, :buildingid, :string
    remove_column :columns, :batteryid, :string
    remove_column :customers, :userid, :string
    remove_column :employees, :userid, :string
    remove_column :elevators, :columnid, :string
  end
end

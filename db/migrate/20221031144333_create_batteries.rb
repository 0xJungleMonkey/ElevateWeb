class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.integer :BuildingID
      t.string :Type
      t.string :Status
      t.integer :EmployeeID
      t.date :CommissionDate
      t.date :LastInspectionDate
      t.string :OperationsCert
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end

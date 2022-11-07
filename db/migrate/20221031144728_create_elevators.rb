class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.integer :ColumnID
      t.integer :SerialNumber
      t.string :Model
      t.string :Type
      t.string :Status
      t.date :CommisionDate
      t.date :LastInspectionDate
      t.string :InspectionCert
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end

class CreateFactElevators < ActiveRecord::Migration[5.2]
  def change
  create_table :fact_elevators do |t|
    t.string :serial_number
    t.datetime :date_of_commissioning
    t.string :building_id
    t.integer :customer_id
    t.string :building_city

    t.timestamps
  end
end
end

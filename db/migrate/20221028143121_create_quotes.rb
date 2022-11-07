class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :building_type
      t.string :service_quality
      t.string :number_of_apartments
      t.string :number_of_floors
      t.string :number_of_businesses
      t.string :number_of_basements
      t.string :number_of_parking
      t.string :number_of_cages
      t.string :number_of_occupants
      t.string :number_of_hours
      t.string :number_of_elevators_needed
      t.string :price_per_unit
      t.string :elevator_price
      t.string :installation_fee
      t.string :final_price

      t.timestamps
    end
  end
end

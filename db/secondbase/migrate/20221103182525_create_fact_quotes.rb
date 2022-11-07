class CreateFactQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.integer :quoteid
      t.datetime :creation
      t.string :companyname
      t.string :email
      t.integer :nbelevator

      t.timestamps

    end
  end
end

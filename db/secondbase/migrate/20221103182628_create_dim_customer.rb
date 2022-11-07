class CreateDimCustomer < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.datetime :creationdate
      t.string :companyname
      t.string :fullnameofcompanymaincontact
      t.string :emailofcompanymaincontact
      t.string :nbelevators
      t.string :customercity

      t.timestamps
    end
  end
end
 

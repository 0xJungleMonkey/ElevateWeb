class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.integer :CustomerID
      t.string :AddressOfBuilding
      t.string :FullNameOfBuildingAdmin
      t.string :EmailOfAdminOfBuilding
      t.integer :PhoneNumOfBuildingAdmin
      t.string :FullNameOfTechContactForBuilding
      t.string :TechContactEmailForBuilding
      t.integer :TechContactPhoneForBuilding

      t.timestamps
    end
  end
end

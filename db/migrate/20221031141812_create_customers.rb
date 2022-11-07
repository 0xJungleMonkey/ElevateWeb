class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :UserID
      t.string :CustomerCreationDate
      t.string :date
      t.string :CompanyName
      t.string :CompanyHQAdress
      t.string :FullNameOfCompanyContact
      t.string :CompanyContactPhone
      t.string :CompanyContactEMail
      t.text :CompanyDesc
      t.string :FullNameServiceTechAuth
      t.string :TechAuthPhoneService
      t.string :TechManagerEmailService

      t.timestamps
    end
  end
end

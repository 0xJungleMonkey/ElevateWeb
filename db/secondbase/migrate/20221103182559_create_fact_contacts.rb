class CreateFactContacts < ActiveRecord::Migration[5.2]
  def change
  create_table :fact_contacts do |t|
    t.integer :contactid
    t.datetime :creationdate
    t.string :companyname
    t.string :email
    t.string :projectname

    t.timestamps
  end
end
end
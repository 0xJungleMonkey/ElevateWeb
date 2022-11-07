class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :Full_name_of_the_contact
      t.string :Bussiness_name
      t.string :Email
      t.string :Phone
      t.string :Project_name
      t.string :Project_description
      t.string :Department_incharge
      t.string :Message
      t.string :Attached_file
      t.datetime :Creation_date
      t.timestamps
    end
  end
end

class Addcolumntoquotes < ActiveRecord::Migration[5.2]
  
    def change
      add_column :quotes, :name, :string 
      add_column :quotes, :company_name, :string
      add_column :quotes, :email, :string 
      add_column :quotes, :phone, :string
      add_column :quotes, :department, :string
      add_column :quotes, :project_name, :string
      add_column :quotes, :project_description, :string
    end
  end


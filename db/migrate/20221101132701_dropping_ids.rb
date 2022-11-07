class DroppingIds < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :customerid, :string
  end
end

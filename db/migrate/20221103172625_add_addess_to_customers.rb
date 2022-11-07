class AddAddessToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :address, foreign_key: true, first: true
  end
end

class AddingAddressId < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :address, foreign_key: true, first: true
  end
end

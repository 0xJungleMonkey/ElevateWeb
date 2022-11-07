class AddingBuildingAssoc < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :customers, foreign_key: true, first: true
    
  end
end

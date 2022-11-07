class DropingIdsAgain < ActiveRecord::Migration[5.2]
  def change
    remove_reference :batteries, :buildings, foreign_key: true, first: true
    remove_reference :batteries, :employees, foreign_key: true, first: true
    remove_reference :building_details, :buildings, foreign_key: true, first: true
    remove_reference :columns, :batteries, foreign_key: true, first: true
    remove_reference :customers, :users, foreign_key: true, first: true
    remove_reference :elevators, :columns, foreign_key: true, first: true
    remove_reference :buildings, :customers, foreign_key: true, first: true
    
  end
end

class ChangingDataTypeInLead < ActiveRecord::Migration[5.2]
  def change
    change_column :leads, :Attached_file, :blob, limit: 10.megabyte
  end
end

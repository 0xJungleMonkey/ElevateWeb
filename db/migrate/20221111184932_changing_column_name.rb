class ChangingColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :leads, :attached_file, :Attached_file
  end
end

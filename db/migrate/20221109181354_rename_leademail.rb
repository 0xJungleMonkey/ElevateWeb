class RenameLeademail < ActiveRecord::Migration[5.2]
  def chnage
    rename_column :leads, :Email, :email
  end
end

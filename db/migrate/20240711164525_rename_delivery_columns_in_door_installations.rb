class RenameDeliveryColumnsInDoorInstallations < ActiveRecord::Migration[6.1]
  def change
    rename_column :door_installations, :delivery_date, :installation_date
    rename_column :door_installations, :delivery_time, :installation_time
  end
end

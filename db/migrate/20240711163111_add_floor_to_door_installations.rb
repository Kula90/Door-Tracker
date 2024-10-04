class AddFloorToDoorInstallations < ActiveRecord::Migration[7.0]
  def change
    add_column :door_installations, :floor, :integer
  end
end

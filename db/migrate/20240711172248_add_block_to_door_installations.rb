class AddBlockToDoorInstallations < ActiveRecord::Migration[7.0]
  def change
    add_column :door_installations, :block, :string
  end
end

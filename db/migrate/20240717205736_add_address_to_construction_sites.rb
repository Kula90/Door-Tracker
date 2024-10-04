class AddAddressToConstructionSites < ActiveRecord::Migration[7.0]
  def change
    add_column :construction_sites, :address, :string
  end
end

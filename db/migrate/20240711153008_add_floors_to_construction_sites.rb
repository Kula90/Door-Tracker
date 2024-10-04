class AddFloorsToConstructionSites < ActiveRecord::Migration[7.0]
  def change
    add_column :construction_sites, :floors, :integer
  end
end

class AddStatusToRequestedDeliveries < ActiveRecord::Migration[6.1]
  def change
    add_column :requested_deliveries, :status, :string, default: "pending"
  end
end

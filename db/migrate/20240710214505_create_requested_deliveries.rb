class CreateRequestedDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :requested_deliveries do |t|
      t.integer :number_of_doors
      t.date :delivery_date
      t.time :delivery_time
      t.datetime :submitted_at
      t.references :construction_site, null: false, foreign_key: true

      t.timestamps
    end
  end
end

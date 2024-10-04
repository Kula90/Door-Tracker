class CreateDoorInstallations < ActiveRecord::Migration[6.1]
  def change
    create_table :door_installations do |t|
      t.integer :number_of_doors, null: false
      t.date :installation_date, null: false
      t.time :installation_time, null: false
      t.integer :floor, null: false
      t.datetime :submitted_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.references :construction_site, null: false, foreign_key: true

      t.timestamps
    end
  end
end

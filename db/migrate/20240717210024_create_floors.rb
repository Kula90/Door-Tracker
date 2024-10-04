class CreateFloors < ActiveRecord::Migration[7.0]
  def change
    create_table :floors do |t|
      t.integer :number_of_floors
      t.references :construction_site, null: false, foreign_key: true

      t.timestamps
    end
  end
end

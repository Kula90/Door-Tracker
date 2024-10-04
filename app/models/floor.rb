# app/models/floor.rb
class Floor < ApplicationRecord
  belongs_to :construction_site
  validates :number_of_floors, presence: true, numericality: { only_integer: true, greater_than: 0 }
end

# app/models/construction_site.rb
class ConstructionSite < ApplicationRecord
  has_many :requested_deliveries, dependent: :destroy
  has_many :delivered_deliveries, dependent: :destroy
  has_many :door_installations, dependent: :destroy

  validates :name, presence: true
  validates :floors, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def total_number_of_doors
    door_installations.sum(:number_of_doors)
  end

  def total_delivered_doors
    delivered_deliveries.sum(:number_of_doors)
  end

  def total_requested_doors
    requested_deliveries.sum(:number_of_doors)
  end
end

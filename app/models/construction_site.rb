# app/models/construction_site.rb
class ConstructionSite < ApplicationRecord
  has_many :requested_deliveries, dependent: :destroy
  has_many :delivered_deliveries, dependent: :destroy
  has_many :door_installations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, message: " must be at least 3 characters long" }
  validates :floors, presence: true

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

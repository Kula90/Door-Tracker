# app/models/delivered_delivery.rb
class DeliveredDelivery < ApplicationRecord
  belongs_to :construction_site

  validates :number_of_doors, presence: true
  validates :delivery_date, presence: true
  validates :delivery_time, presence: true
end

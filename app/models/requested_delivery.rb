class RequestedDelivery < ApplicationRecord
  belongs_to :construction_site

  validates :status, inclusion: { in: ["pending", "completed"], message: "%{value} is not a valid status" }
  validates :number_of_doors, presence: true
  validates :delivery_date, presence: true
  validates :delivery_time, presence: true

  scope :completed, -> { where(status: "completed") }
end
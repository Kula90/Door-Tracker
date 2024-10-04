class DoorInstallation < ApplicationRecord
  belongs_to :construction_site

  validates :number_of_doors, presence: true
  validates :installation_date, presence: true
  validates :installation_time, presence: true
  validates :floor, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :block, presence: true

  before_save :parse_installation_time

  private

  def parse_installation_time
    self.installation_time = Time.parse(installation_time) if installation_time.is_a?(String)
  end
end

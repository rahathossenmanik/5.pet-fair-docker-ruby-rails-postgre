class PetType < ApplicationRecord
  self.table_name = "pet_type"

  validates :label, presence: true

  before_create :set_time_stamps
  before_save :set_time_stamps

  private
  def set_time_stamps
    self.createDate = DateTime.now if self.new_record?
    self.updateDate = DateTime.now
  end
end

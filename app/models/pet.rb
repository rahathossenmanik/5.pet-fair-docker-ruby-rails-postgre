class Pet < ApplicationRecord
  self.table_name = "pet"

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :"petType", presence: true, numericality: { only_integer: true }
  validates :character, presence: true, numericality: { only_integer: true }
  validates :about, presence: true
  validates :favorite, presence: true
  validates :image, presence: true
  validates :loveCount, numericality: { only_integer: true }

  before_create :set_time_stamps
  before_save :set_time_stamps

  before_create :set_love_count

  private
  def set_time_stamps
    self.createDate = DateTime.now if self.new_record?
    self.updateDate = DateTime.now
  end

  def set_love_count
    self.loveCount = 0 if self.new_record?
  end
end

class Reservation < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :member, numericality: { only_integer: true,greater_than_or_equal_to: 1 }
  validates :total_price, presence: true, if: :date_valid?
  validates :period, presence: true, if: :date_valid?
  validates :user_id, presence: true
  validates :room_id, presence: true
  validate :get_date_check

  def date_valid?
    self.start_date && self.end_date
  end

  def get_date_check
    if self.start_date && self.end_date
      if self.start_date > self.end_date
        errors.add(:end_date, "は開始日より前の日付は選択できません")
      end
    end
  end

  # リレーション
  belongs_to :room
  belongs_to :user
  # リレーション

end

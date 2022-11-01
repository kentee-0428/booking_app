class Room < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :price, presence: true
  validates :address, presence: true, length: {maximum: 30}
  validates :image, presence: true
  validates :introduction, presence: true, length: {maximum: 50}
  validates :user_id, presence: true

  # イメージカラムを指定
  mount_uploader :image, RoomImageUploader
  #イメージカラムを指定

  # リレーション
  belongs_to :user
  has_many :reservations
  # リレーション

end

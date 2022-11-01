class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  # イメージカラムを指定
  mount_uploader :image_name, ImageUploader
  #イメージカラムを指定

  # リレーション
  has_many :rooms
  has_many :reservations
  # リレーション

  validates :name, presence: true
  validates :email, presence: true
  validates :introduction, presence: true, on: :update
  validates :image_name, presence: true, on: :update
  validates :encrypted_password, presence: true
end

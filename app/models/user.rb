class User < ApplicationRecord
  has_many :rides
  has_many :connections
  has_many :plans
  has_one_attached :profile_image
  belongs_to :province
  has_secure_password
  is_numeric :phone

  validates :address, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :full_name, presence: true, length: { maximum: 100 }
  validates :phone, presence: true, length: { maximum: 20 }
  validates :public, inclusion: { in: [true, false] }
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
end

class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :from, presence: true, length: { maximum: 255 }
  validates :to, presence: true, length: { maximum: 255 }
  validates :time, presence: true
  validates :seats, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price_share, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def self.ransackable_attributes(auth_object = nil)
    ["active", "created_at", "from", "id", "id_value", "price_share", "seats", "time", "to", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "category"]
  end
end

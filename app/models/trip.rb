class Trip < ApplicationRecord
  belongs_to :connection
  belongs_to :ride
  belongs_to :plan

  validates :connection, presence: true
  validates :ride, presence: true
  validates :plan, presence: true
end

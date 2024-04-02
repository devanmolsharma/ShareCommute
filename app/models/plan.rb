class Plan < ApplicationRecord
  has_many :trips
  belongs_to :user
end

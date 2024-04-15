class Connection < ApplicationRecord
  belongs_to :user_1, class_name: 'User'
  belongs_to :user_2, class_name: 'User'

  validates :user_1, presence: true
  validates :user_2, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["user_1", "user_2"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["connection_status", "created_at", "id", "id_value", "updated_at", "user_1_id", "user_2_id"]
  end
end

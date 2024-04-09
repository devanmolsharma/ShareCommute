class Province < ApplicationRecord
  has_many :users
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at","gst","pst"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["users"]
  end
end

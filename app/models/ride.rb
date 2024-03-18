class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :category


  def self.ransackable_attributes(auth_object = nil)
    ["active", "created_at", "from", "id", "id_value", "price_share", "seats", "time", "to", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user",'category']
  end

end

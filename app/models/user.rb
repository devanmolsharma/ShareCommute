class User < ApplicationRecord
    has_many :rides
    has_many :connections
    has_many :plans
    has_one_attached :profile_image
    belongs_to :province
    has_secure_password
    
  def self.ransackable_associations(auth_object = nil)
    ["rides","province",]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "email", "full_name", "id", "id_value", "phone", "public", "updated_at", "verified","password_digest"]
  end
end

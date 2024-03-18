class Category < ApplicationRecord
    has_many :rides

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "id_value", "name", "updated_at"]
      end

      def self.ransackable_associations(auth_object = nil)
        ["rides"]
      end
end

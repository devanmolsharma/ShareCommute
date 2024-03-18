class Trip < ApplicationRecord
  belongs_to :connection
  belongs_to :ride
end

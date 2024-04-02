class Trip < ApplicationRecord
  belongs_to :connection
  belongs_to :ride
  belongs_to :plan
end

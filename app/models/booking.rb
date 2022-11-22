class Booking < ApplicationRecord
  belongs_to :celebrity
  belongs_to :user
end

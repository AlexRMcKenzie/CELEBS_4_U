class Celebrity < ApplicationRecord
  has_many :bookings, dependent: :destroy
end

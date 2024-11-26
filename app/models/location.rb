class Location < ApplicationRecord
  enum category: { public_park: 0, club_with_licence: 1, bar: 2, playground_with_booking: 3 }

  has_many :playgrounds
end

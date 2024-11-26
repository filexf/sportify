class Location < ApplicationRecord
  enum category: { public_park: 0, club_with_licence: 1, bar: 2, playground_with_booking: 3 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :playgrounds
end

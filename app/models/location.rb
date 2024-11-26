class Location < ApplicationRecord
  enum :type, [:public_park, :club_with_licence, :bar, :playground_with_booking]
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :playgrounds
end

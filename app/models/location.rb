class Location < ApplicationRecord
  enum :type, [:public_park, :club_with_licence, :bar, :playground_with_booking]

  has_many :playgrounds
end

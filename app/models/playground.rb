class Playground < ApplicationRecord
  belongs_to :location
  belongs_to :sport

  has_many :events
end

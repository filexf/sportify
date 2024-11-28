class Playground < ApplicationRecord
  belongs_to :location
  belongs_to :sport

  has_many :events

  def name
    "#{self.location.name} - #{self.sport.name}"
  end
end

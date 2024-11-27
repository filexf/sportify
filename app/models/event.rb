class Event < ApplicationRecord
  belongs_to :playground
  belongs_to :organisator, class_name: "User"

  has_many :playgrounds
  has_many :locations, through: :playgrounds
  has_one :sport, through: :playgrounds
  #  has_many :sports, through: :playgrounds
  has_many :participations
  has_many :players, through: :participations, source: :user
end

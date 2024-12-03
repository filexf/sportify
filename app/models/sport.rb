class Sport < ApplicationRecord
  # has_many :user_sports a priori on en a pas besoin
  has_many :playgrounds
  has_many :locations, through: :playgrounds
  has_many :publications

  has_one_attached :photo
end

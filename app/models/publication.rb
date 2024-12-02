class Publication < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  has_one_attached :photo

  SPORTS = %w[Basketball Palet Padel Fléchettes Lancer\ de\ mouettes Tir\ à\ la\ mouette Tennis]
end

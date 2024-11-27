class User < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :user_sports
  has_many :favorite_sports, through: :user_sports, source: :sport
  has_many :participations
  has_many :events_as_player, through: :participations, source: :event
  has_many :events_as_organiser, class_name: "Event", foreign_key: :organisator_id

  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

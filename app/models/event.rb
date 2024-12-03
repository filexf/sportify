class Event < ApplicationRecord
  SPORT = ["padel","palet"]

  include PgSearch::Model

  belongs_to :playground
  belongs_to :organisator, class_name: "User"

  has_one :sport, through: :playground
  has_one :location, through: :playground
  has_many :participations
  has_many :players, through: :participations, source: :user

  attr_accessor :event_date, :start_time, :end_time

  before_save lambda {
    self.start_at = construct_datetime(:start_time)
    self.end_at = construct_datetime(:end_time)
  }

  pg_search_scope :global_search,
    against: [ :name ],
    associated_against: {
      sport: [ :name, :description ],
      location: [ :name]
  },
    using: {
      tsearch: { prefix: true }
    }

  def coordinates
    {
      lat: location.latitude,
      lng: location.longitude
    }
  end

  def address
    location.address
  end

  private

  def construct_datetime(time)
    # {"event"=>{"name"=>"",
    #  "description"=>"",
    #  "playground_id"=>"",
    #  "event_date"=>"2024-12-04",
    #  "start_time"=>"12:00",
    #  "end_time"=>"13:00"},
    #  "commit"=>"C'est parti!"}
    hour = time.split[0]
    minutes = time.split[1]
    day = event_date.split("-")[2]
    month = event_date.split("-")[1]
    year = event_date.split("-")[0]

  return "#{year}/#{month}/#{day}, #{hour}:#{minutes}"

  end

end

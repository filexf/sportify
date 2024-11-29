class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: [ :pending, :accepted, :declined ], _default: "pending"
end

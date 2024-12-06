class Publication < ApplicationRecord
  belongs_to :user
  has_many :comments
  # has_many :likes
  belongs_to :sport
  belongs_to :event, optional: true

  has_one_attached :photo

  after_save :publi_posted_at

  after_create_commit :broadcast_publication

  SPORTS = %w[Basketball Palet Padel Fléchettes Lancer\ de\ mouettes Tir\ à\ la\ mouette Tennis]

  private

  def publi_posted_at
    if self.posted_at.nil?
        self.update(posted_at: created_at)
    end
  end

  def broadcast_publication
    if self.event.present?
    broadcast_prepend_to "publications",
      partial: "publications/event_creation_card",
      target: "publications",
      locals: { publication: self }
    else
    broadcast_prepend_to "publications",
      partial: "publications/player_creation_card",
      target: "publications",
      locals: { publication: self }
    end
  end
end

class AddEventToPublications < ActiveRecord::Migration[7.1]
  def change
    add_reference :publications, :event, foreign_key: true
  end
end

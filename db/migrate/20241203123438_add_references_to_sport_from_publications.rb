class AddReferencesToSportFromPublications < ActiveRecord::Migration[7.1]
  def change
    add_reference :publications, :sport, foreign_key: true
  end
end

class RemoveSportFromPublications < ActiveRecord::Migration[7.1]
  def change
    remove_column :publications, :sport, :integer
  end
end

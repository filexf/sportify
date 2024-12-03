class RemoveColumnSportFromPublications < ActiveRecord::Migration[7.1]
  def change
    remove_column :publications, :sport, :string
  end
end

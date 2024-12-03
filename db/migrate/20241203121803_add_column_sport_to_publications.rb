class AddColumnSportToPublications < ActiveRecord::Migration[7.1]
  def change
    add_column :publications, :sport, :integer, null: false
  end
end

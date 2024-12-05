class AddPostedAtColumnToPublications < ActiveRecord::Migration[7.1]
  def change
    add_column :publications, :posted_at, :datetime
  end
end

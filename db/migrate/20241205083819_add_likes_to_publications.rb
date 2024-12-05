class AddLikesToPublications < ActiveRecord::Migration[7.1]
  def change
    add_column :publications, :likes, :integer
  end
end

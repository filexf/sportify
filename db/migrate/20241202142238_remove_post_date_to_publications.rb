class RemovePostDateToPublications < ActiveRecord::Migration[7.1]
  def change
    remove_column :publications, :post_date
  end
end

class RemovePostDateFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :post_date, :date
  end
end

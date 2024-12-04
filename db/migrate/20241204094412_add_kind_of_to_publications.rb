class AddKindOfToPublications < ActiveRecord::Migration[7.1]
  def change
    add_column :publications, :kind_of, :string
  end
end

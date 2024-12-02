class CreatePublications < ActiveRecord::Migration[7.1]
  def change
    create_table :publications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :sport
      t.date :post_date
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

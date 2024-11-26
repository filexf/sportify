class CreatePlaygrounds < ActiveRecord::Migration[7.1]
  def change
    create_table :playgrounds do |t|
      t.references :location, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSports < ActiveRecord::Migration[7.1]
  def change
    create_table :sports do |t|
      t.string :name
      t.text :description
      t.integer :number_of_players_min, default: 1
      t.integer :number_of_players_max

      t.timestamps
    end
  end
end

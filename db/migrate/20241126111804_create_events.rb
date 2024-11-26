class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start_at
      t.date :end_at
      t.references :playground, null: false, foreign_key: true
      t.references :organisator, null: false, foreign_key: { to_table: :users }
      t.text :description

      t.timestamps
    end
  end
end

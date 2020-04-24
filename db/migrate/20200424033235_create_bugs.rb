class CreateBugs < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs do |t|
      t.string :name
      t.string :image
      t.integer :sell
      t.string :where
      t.string :weather
      t.string :rarity
      t.time :start_time
      t.time :end_time
      t.integer :internal_id

      t.timestamps
    end
  end
end

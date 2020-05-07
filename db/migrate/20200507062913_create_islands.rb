class CreateIslands < ActiveRecord::Migration[6.0]
  def change
    create_table :islands do |t|
      t.string :player_name
      t.string :island_name
      t.references :user

      t.timestamps
    end
  end
end

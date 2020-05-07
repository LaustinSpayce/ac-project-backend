class CreateBugsCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :bugs_collections do |t|
      t.belongs_to :bug
      t.belongs_to :user
      t.boolean :collected
      t.boolean :donated
      t.timestamps
    end
  end
end

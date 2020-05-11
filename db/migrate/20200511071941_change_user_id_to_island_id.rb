class ChangeUserIdToIslandId < ActiveRecord::Migration[6.0]
  def change
    rename_column :bug_collections, :user_id, :island_id
  end
end

class Rename < ActiveRecord::Migration[6.0]
  def change
    rename_table :bugs_collections, :bug_collections
  end
end

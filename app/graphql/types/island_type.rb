module Types
  class IslandType < Types::BaseObject
    field :id, ID, null: true
    field :player_name, String, null: false
    field :island_name, String, null: true
    field :user_id, Int, null: false
    field :bug_collection, [Types::BugCollectionType], null: true
  end
end
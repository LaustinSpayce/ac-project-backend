module Types
  class BugCollectionType < Types::BaseObject
    field :id, ID, null: false
    field :island, [Types::IslandType], null: false
    field :bug, [Types::BugType], null: false
    field :collected, Boolean, null: true
    field :donated, Boolean, null: true
  end
end

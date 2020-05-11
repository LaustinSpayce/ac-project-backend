module Types
  class BugType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :image, String, null: true
    field :sell, Integer, null: true
    field :where, String, null: true
    field :weather, String, null: true
    field :rarity, String, null: true
    field :months, [Types::MonthType], null: true
    # field :bugs_collection, [Types::BugCollectionType], null: true
    field :internal_id, Integer, null: true
  end
end

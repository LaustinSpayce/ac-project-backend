module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :bugs, [Types::BugType], null: false

    def bugs
      Bug.all
    end

    field :bug, Types::BugType, null: false do
      argument :id, ID, required: true
    end

    def bug(id:)
      Bug.find(id)
    end
  end
end
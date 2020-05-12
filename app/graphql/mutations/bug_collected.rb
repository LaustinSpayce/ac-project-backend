class Mutations::BugCollected < Mutations::BaseMutation
  before_action :authenticate_user!

  argument :island, Integer, required: true
  argument :bug, Integer, required: true
  argument :collected, Boolean, required: true
  argument :donated, Boolean, required: true

  def resolve(
    description: 'Must be logged in. Register if you have a bug caught or not',
    url: nil
  )
    current_user_island = current_user.island
    if bug_collection_record =
         BugCollection.where(island: current_user_island, bug: Bug.find(bug))
      bug_collection_record.collected = collected
      bug_collection_record.donated = donated
      bug_collection_record.save
    else
      BugCollection.create(
        island: current_user_island,
        bug: Bug.find(bug),
        collected: collected,
        donated: donated
      )
    end
  end
end

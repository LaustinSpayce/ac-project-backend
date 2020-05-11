class Mutations::BugCollected < Mutations::BaseMutation
  argument :island, Integer, required: true
  argument :bug, Integer, required: true

  
end
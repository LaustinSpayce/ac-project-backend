class BugCollection < ApplicationRecord
  belongs_to :island
  belongs_to :bug

  validates_uniqueness_of :island_id, scope: :bug_id
end

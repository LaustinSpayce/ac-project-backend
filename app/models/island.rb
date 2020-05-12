class Island < ApplicationRecord
  belongs_to :user
  has_many :bug_collections
  has_many :bugs, through: :bug_collections
end

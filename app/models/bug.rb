class Bug < ApplicationRecord
  has_and_belongs_to_many :months
  has_many :bug_collection
  has_many :islands, through: :bug_collection
end

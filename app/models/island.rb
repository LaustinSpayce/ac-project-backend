class Island < ApplicationRecord
  belongs_to :user
  has_many :bugs, :through => :bugs_collections
end

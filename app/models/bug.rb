class Bug < ApplicationRecord
  has_and_belongs_to_many :months
  has_and_belongs_to_many :islands
  has_many :users, :through => :bugs_collections
end

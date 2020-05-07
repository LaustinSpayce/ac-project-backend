# frozen_string_literal: true

class User < ActiveRecord::Base
  # The User is just for authentication. Keep the data inside the island record.
  has_one :island
  # After registration, make a blank island for our user.
  after_create :init_island
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
  include DeviseTokenAuth::Concerns::User

  def init_island
    self.build_island.save(validate: false)
  end
end

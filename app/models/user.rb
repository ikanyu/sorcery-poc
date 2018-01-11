class User < ApplicationRecord
  rolify
  authenticates_with_sorcery!

  validates :email, presence: true
  validates :password, presence: true

  attr_accessor :admin_role
end

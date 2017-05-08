require 'bcrypt'
class User < ApplicationRecord
  belongs_to :role
  has_one :store
  has_secure_password
end

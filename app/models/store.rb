class Store < ApplicationRecord
  validates :storename, presence: true, uniqueness: true
  belongs_to :user
end

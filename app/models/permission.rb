class Permission < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :permits
end

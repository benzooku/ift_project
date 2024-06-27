class Role < ApplicationRecord
  validates :name, presence: true
  validates :rank, presence: true, length: { in: 0..1000 }

  has_many :role_assignments, dependent: :destroy
  has_many :workers, through: :role_assignments

  has_many :permits, dependent: :destroy
  has_many :permissions, through: :permits

  belongs_to :project
end

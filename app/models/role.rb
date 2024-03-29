class Role < ApplicationRecord
  validates :name, presence: true
  validates :rank, presence: true, comparison: { less_than_or_equal_to: 1000 }

  has_many :role_assignments, dependent: :destroy
  has_many :workers, through: :role_assignments

  has_many :permits, dependent: :destroy
  has_many :permissions, through: :permits

  belongs_to :project, foreign_key: true
end

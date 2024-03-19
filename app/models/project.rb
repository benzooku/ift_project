class Project < ApplicationRecord
  validates :name, presence: true, length: { in: 4..20 }
  has_many :workers
  has_many :users, through: :workers
end

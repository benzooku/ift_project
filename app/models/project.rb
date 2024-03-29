class Project < ApplicationRecord
  validates :name, presence: true, length: { in: 4..255 }

  has_many :workers, dependent: :destroy
  has_many :users, through: :workers

  has_many :roles, dependent: :destroy
end

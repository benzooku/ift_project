class Worker < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :user, presence: true
  validates :project, presence: true

  has_many :role_assignments, dependent: :destroy
  has_many :roles, through: :role_assignments
  has_many :permits, through: :roles

  has_many :assignments, dependent: :destroy
  has_many :tasks, through: :assignments
  has_many :task_notes

  has_many :groupings, dependent: :destroy
  has_many :groups, through: :groupings
end

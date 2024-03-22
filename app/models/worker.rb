class Worker < ApplicationRecord
  belongs_to :user
  belongs_to :project

  has_many :role_assignments
  has_many :roles, through: :role_assignments
  has_many :permits, through: :roles
end

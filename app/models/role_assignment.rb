class RoleAssignment < ApplicationRecord
  belongs_to :worker, foreign_key: true
  belongs_to :role, foreign_key: true
end

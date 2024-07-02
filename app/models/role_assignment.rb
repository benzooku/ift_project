class RoleAssignment < ApplicationRecord
  belongs_to :worker
  belongs_to :role
end

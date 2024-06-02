class Permit < ApplicationRecord
  belongs_to :role, foreign_key: true
  belongs_to :permission, foreign_key: true
end

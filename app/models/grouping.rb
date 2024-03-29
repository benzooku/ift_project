class Grouping < ApplicationRecord
  belongs_to :worker, foreign_key: true
  belongs_to :group, foreign_key: true
end

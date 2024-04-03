class TaskNote < ApplicationRecord
  belongs_to :task
  belongs_to :worker

  validates :content, presence: true, length: { in: 1..500 }
end

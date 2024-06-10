class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true, length: { in: 1..255 }
  validates :description, length: { in: 1..1000 }
  validates :expected_finish_date, presence: true 
  validates :start_date, presence: true

  has_many :assignments, dependent: :destroy
  has_many :workers, through: :assignments

  has_many :task_dependencies, dependent: :destroy
  has_many :base_tasks, through: :task_dependencies

  has_many :task_notes, dependent: :destroy

end

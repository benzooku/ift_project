class TaskNote < ApplicationRecord
  belongs_to :task
  belongs_to :worker

  validates :content, presence: true, length: { in: 1..500 }
  

  after_create_commit -> {broadcast_prepend_to "task_notes", partial: "task_notes/task_note", locals: { task_note: self } }

end


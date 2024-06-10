class TaskDependency < ApplicationRecord
  belongs_to :task
  belongs_to :base_task, :class_name => 'Task'
end

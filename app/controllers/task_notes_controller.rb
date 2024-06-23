class TaskNotesController < ApplicationController
  def create
    note = TaskNote.new(content: params[:task_note][:content],
                      task_id: params[:task_id])
    note.worker = Worker.find_by(project_id: params[:project_id], user_id: current_user.id)
    if note.save!
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('task_notes', partial: 'task_note', locals: {task_note: note}) }
      end
    else
      note.destroy
      render :new, status: :unprocessable_entity
    end
  end
end

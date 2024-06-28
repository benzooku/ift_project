class TasksController < ApplicationController
  before_action :sign_in_gate!
  before_action :worker_gate!
  # Giebt Liste von Tasks zurück, mit denen der Nutzer assoziiert ist
  # Nutzer muss angemeldet sein, um diese Seite aufzurufen
  #
  # Wenn nicht angemeldet, führt auf Anmeldet seite weiter
  # Sichert angefragte Seite, um nach anmeldung zurückzuführen
  def index
    @tasks = Project.find(params[:project_id]).tasks.all.order("created_at DESC")
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = params[:project_id]
    if @task.save!
      params[:task][:task_ids].each { |base_task_id|
        TaskDependency.create(base_task_id: base_task_id, task_id: @task.id)
      }
      Assignment.create(worker_id: @current_worker.id, task_id: @task.id)
      redirect_to tasks_path(locale: locale) + '/' + @task.id.to_s
    else
      @task.destroy
      render :new, status: :unprocessable_entity
    end
  end

  # Gibt Projekt anhand von ID weiter
  # Nimmt ID in URL-Parameter
  def show
    @task = @current_worker.tasks.find(params[:task_id])
    @task_dependencies = @task.base_tasks.all
    @task_notes = @task.task_notes.all.order("created_at DESC")
    @task_note = TaskNote.new
  rescue ActiveRecord::RecordNotFound
    flash.alert = I18n.t 'tasks.notFound'
    redirect_to projects_url
  end

  def edit
    @task = @current_worker.tasks.find(params[:task_id])
    @task_dependencies = @task.base_tasks.all
  rescue ActiveRecord::RecordNotFound
    flash.alert = I18n.t 'tasks.notFound'
    redirect_to projects_url
  end

  def update
    @task = @current_worker.tasks.find(params[:task_id])
    @task_dependencies = @task.task_dependencies.all
    @task.update(name: params[:task][:name], description: params[:task][:description], expected_finish_date: params[:task][:expected_finish_date], start_date: params[:task][:start_date])
    
    for dep in @task_dependencies do 
      dep.delete
    end

    params[:task][:task_ids].each { |base_task_id|
      TaskDependency.create(base_task_id: base_task_id, task_id: @task.id)
    }

    redirect_to tasks_path(locale: locale) + '/' + @task.id.to_s
  end

  protected

  # Validiert Parameter von POST-Request auf für Task benötigte
  def task_params
    params.require(:task).permit(:name, :description, :expected_finish_date, :start_date)
  end
end

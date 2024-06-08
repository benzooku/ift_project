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
      if params[:task][:id]
      end
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
  rescue ActiveRecord::RecordNotFound
    flash.alert = I18n.t 'tasks.notFound'
    redirect_to projects_url
  end

  protected

  # Validiert Parameter von POST-Request auf für Project benötigte
  def task_params
    params.require(:task).permit(:name, :description, :expected_finish_date, :start_date)
  end
end

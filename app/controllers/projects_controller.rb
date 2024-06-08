#typed: true

class ProjectsController < ApplicationController
  before_action :sign_in_gate!
  before_action :worker_gate!, only: [:show]

  # Giebt Liste von Projekten zurück, mit denen der Nutzer assoziiert ist
  # Nutzer muss angemeldet sein, um diese Seite aufzurufen
  #
  # Wenn nicht angemeldet, führt auf Anmeldet seite weiter
  # Sichert angefragte Seite, um nach anmeldung zurückzuführen
  def index
    @projects = current_user.projects.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      project_default_associations(@project, current_user)
      redirect_to projects_path(locale: locale) + '/' +@project.id.to_s
    else
      @project.destroy
      @worker.destroy
      render :new, status: :unprocessable_entity
    end
  end


  # Gibt Projekt anhand von ID weiter
  # Nimmt ID in URL-Parameter
  def show
    @project = current_user.projects.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    flash.alert = I18n.t 'projects.notFound'
    redirect_to projects_url
  end

  protected

  # Generiert standart Datenbank-Einträge für ein neues Projekt
  # Datenbank <= Worker, Role(Admin), Permit, RolesAssignment
  #
  # @param [Project] prj das zu verwendende Projekt.
  # @param [User] usr der zu verwendende User.
  def project_default_associations(prj, usr)
    worker = Worker.create(project_id: prj.id, user_id: usr.id)
    role = Role.create(project_id: prj.id, name: 'Admin', rank: 1000)
    permit = Permit.create(role_id: role.id, permission_id: 1)
    role_assignment = RoleAssignment.create(worker_id: worker.id, role_id: role.id)
  end

  # Validiert Parameter von POST-Request auf für Project benötigte
  def project_params
    params.require(:project).permit(:name)
  end
end

#typed: true
#
class ProjectsController < ApplicationController
  before_action :sign_in_gate

  # Gibt Projekt anhand von ID weiter
  # Nimmt ID in URL-Parameter
  def index
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash.alert = 'Projekt nicht gefunden!'
    redirect_to projects_url
  end

  def new
    @project = Project.new
  end

  def create
  end

  # Giebt Liste von Projekten zurück, mit denen der Nutzer assoziiert ist
  # Nutzer muss angemeldet sein, um diese Seite aufzurufen
  #
  # Wenn nicht angemeldet, führt auf Anmeldet seite weiter
  # Sichert angefragte Seite, um nach anmeldung zurückzuführen
  def list
    @projects = current_user.projects.all
  end

  def create
  end
end

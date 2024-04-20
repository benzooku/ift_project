class ProjectsController < ApplicationController
  def index
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash.alert = I18n.t 'projects.notFound'
    redirect_to projects_url
  end

  def new; end

  def list
    return unless user_signed_in?

    @projects = current_user.project.all
  end
end

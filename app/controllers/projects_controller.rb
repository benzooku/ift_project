class ProjectsController < ApplicationController

  def index
    begin
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash.alert = I18n.t 'projects.notFound'
      redirect_to projects_url
    end
  end

  def new

  end

end

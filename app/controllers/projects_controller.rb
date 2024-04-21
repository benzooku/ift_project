class ProjectsController < ApplicationController
  def index
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash.alert = 'Projekt nicht gefunden!'
    redirect_to projects_url
  end

  def new; end

  def list
    if (user_signed_in?)
      @projects = current_user.projects.all
    else
      session[:fall_back_path] = request.path

      flash[:notice] = "Du musst angemeldet sein, um diese Seite zu sehen!"
      redirect_to sign_in_path

    end
  end

  def new
    @project = Project.new
  end

  def create

  end
end

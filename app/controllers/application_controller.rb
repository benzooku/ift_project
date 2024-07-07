class ApplicationController < ActionController::Base
  before_action :switch_locale

  def switch_locale
    locale = params[:locale] || I18n.default_locale
  end

  protected

  def sign_in_gate!
    session[:fall_back_path] = request.path
    authenticate_user!
  end

  def worker_gate!
    @current_worker = current_user.workers.find_by(project_id: params[:project_id])

    if @current_worker.nil?
      flash[:notice] = I18n.t('projects.notPartOff')  
      redirect_to projects_path
    end
  end

  def permission_gate(*permissions)
    worker_gate! 
    @roles = @current_worker.roles.all
    @user_perms = []
    for @role in @roles do
      for @perm in @role.permissions.all do
        @user_perms.push(@perm.id)
      end
    end
    if (permissions - @user_perms).length != 0
      flash[:notice] = I18n.t('permissions.insufficient')
      redirect_to projects_path
    end

  end
end

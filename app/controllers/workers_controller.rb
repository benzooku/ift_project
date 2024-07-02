class WorkersController < ApplicationController
  before_action :sign_in_gate!
  
  def select; end

  def show
    @role_assignment = RoleAssignment.new
    @worker = Project.find(params[:project_id]).workers.find(params[:worker_id])
    @user = @worker.user
    @roles = @worker.roles.all.order("rank DESC")
  rescue ActiveRecord::RecordNotFound
    flash.alert = I18n.t 'workers.notFound'
    redirect_to workers_url
  end

  def create
    @worker = Worker.new
    @worker.project_id = params[:project_id]
    @worker.user_id = User.find_by(email: worker_params[:email]).id
    
    if Worker.find_by(project_id: @worker.project_id, user_id: @worker.user_id)
      flash[:notice] = I18n.t('workers.existsAlready')
      @worker.destroy
      render :new, status: :unprocessable_entity

    elsif @worker.save!
      redirect_to projects_path(locale: locale) + '/' + params[:project_id]
    else
      @worker.destroy
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @worker = Worker.new 
  end

  def index
    @workers = Project.find(params[:project_id]).workers.all
    @users = Project.find(params[:project_id]).users.all
  end

  def worker_params
    params.require(:worker).permit(:email)
  end

  def add_role    
    params[:role_assignment][:role_ids].each { |role_id|
      RoleAssignment.create(worker_id: params[:worker_id], role_id: role_id)
    }
  end

  def delete_role
    RoleAssignment.find(params[:role_id]).delete
  end

end

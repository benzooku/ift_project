class WorkersController < ApplicationController
  before_action :sign_in_gate!
  
  def select; end

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
    @workers = Worker.find_by(project_id: params[:project_id])
    @users = @workers
  end

  def worker_params
    params.require(:worker).permit(:email)
  end

end

class RolesController < ApplicationController
  before_action :sign_in_gate!
  before_action :worker_gate!

  def index
    @roles = Project.find(params[:project_id]).roles.all.order("rank DESC")
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    @role.project_id= params[:project_id]
    if @role.save!
      params[:role][:permission_ids].each { |permission_id|
        Permit.create(role_id: @role.id, permission_id: permission_id)
      }
      redirect_to roles_path(locale: locale)
    else
      @role.destroy
      render :new, status: :unprocessable_entity
    end
  end

  # Gibt Projekt anhand von ID weiter
  # Nimmt ID in URL-Parameter
  def show
    @role = Project.find(params[:project_id]).roles.find(params[:role_id])
    @permissions = @role.permissions.all
  rescue ActiveRecord::RecordNotFound
    flash.alert = I18n.t 'roles.notFound'
    redirect_to roles_url
  end

  def edit
    @role = Project.find(params[:project_id]).roles.find(params[:role_id])
    @permissions = @role.permissions.all
  rescue ActiveRecord::RecordNotFound
    flash.alert = I18n.t 'roles.notFound'
    redirect_to roles_url
  end

  def update
    @role = Project.find(params[:project_id]).roles.find(params[:role_id])
    @permissions = @role.permits.all
    @role.update(name: params[:role][:name], description: params[:role][:rank])

    for perm in @permissions do
      perm.delete
    end

    params[:role][:permission_ids].each { |permission_id|
      Permit.create(role_id: @role.id, permission_id: permission_id)
    }

    redirect_to roles_path(locale: locale)
  end

  protected

  # Validiert Parameter von POST-Request auf für Task benötigte
  def role_params
    params.require(:role).permit(:name, :rank)
  end
end

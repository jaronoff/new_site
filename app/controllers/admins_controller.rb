class AdminsController < ApplicationController
  def index
    @projects = Project.all
  end

  def edit
    @project = Project.includes(:project_module).find(params[:id])
  end

  def update
    project = Project.find(params['project']['id'])
    
    project.update_attributes(project_params) if project
    
    redirect_to admins_index_url
  end

  private
  def project_params
    params.require(:project).permit!
  end
end

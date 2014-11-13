class AdminsController < ApplicationController
  def index
    @projects = Project.all
  end

  def edit
    @project = Project.includes(:project_modules).find(params[:id])
  end

  def update
  
    project = Project.find(params['project']['id'])
    
    if project and project.update_attributes(project_params)
      puts " update " * 100
    end
    
    redirect_to admins_index_url
  end

  private
  def project_params
    params.require(:project).permit!
  end
end

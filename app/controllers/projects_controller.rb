class ProjectsController < ApplicationController
  def update
    Behance.get_projects

    redirect_to root_url
  end

  def index
    @projects = Project.with_includes.all
  end

  def show
    @project = Project.with_includes.find(params[:id])
  end
end
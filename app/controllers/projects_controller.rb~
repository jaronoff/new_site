class ProjectsController < ApplicationController
  def update
    Behance.get_projects

    redirect_to root_url
  end

  def index
    @projects = Project.with_includes.all
  end

  def show
    @project = Project.with_includes.where('url_name = ? ', params[:name]).first

    # If the project can't be found, then we simply redirect back to the projects index page
    redirect_to projects_url unless @project
  end
end
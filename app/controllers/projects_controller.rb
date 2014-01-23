class ProjectsController < ApplicationController
  def update
    Behance.get_projects

    redirect_to root_url
  end

  def index
    @projects = Project.with_includes.all
  end

  def show
    # set name to match what can be found in the record
    name = params[:name].split('-').join(" ")

    @project = Project.with_includes.where('lower(name) = ? ', name.downcase).first

    # If the project can't be found, then we simply redirect back to the projects index page
    redirect_to projects_url unless @project
  end
end
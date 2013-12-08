class ProjectsController < ApplicationController
  def update
    Behance.get_projects

    redirect_to root_url
  end
end

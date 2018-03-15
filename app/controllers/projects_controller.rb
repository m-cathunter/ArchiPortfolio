class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
  end

  private
      def project_params
      params.require(:project).permit(:title, :description, :author)
      end

end

class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
  end

  private
      def project_params
      params.require(:project).permit(:title, :description, :author)
      end 

end

class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
  #  @project = current_user.projects.build
  end

  def create
    @project = Project.new(project_params)

    @project.save
    redirect_to @project
  #  @project = current_user.projects.build(project_params)
  end

  private
      def project_params
      params.require(:project).permit(:title, :description, :author)
      end

end

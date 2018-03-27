class ProjectsController < ApplicationController
  before_action :authenticate_user!
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = current_user.projects.build
  end

  def edit
    @project = Project.new(project_params)
  end

  def create
    @project = Project.new(project_params)
    @project.user=current_user
  if @project.save
    redirect_to @project
  else
    render 'new'
  end
  #  binding.pry
    #redirect_to @project
  #  @project = current_user.projects.build(project_params)
  end

  private
      def project_params
        params.require(:project).permit(:title, :description, :author)
      end

end

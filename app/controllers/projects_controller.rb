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
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.user=current_user

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.user=current_user

    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
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

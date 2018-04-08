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
    @project = current_user.projects.build(project_params)

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
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to root_path
  end

  #  binding.pry
    #redirect_to @project
  #  @project = current_user.projects.build(project_params)


  private
      def project_params
        params.require(:project).permit(:title, :description, :author, :project_img)
      end
end

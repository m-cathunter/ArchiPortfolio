class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :categories, only: [:new, :edit, :update, :create]

  def index
    if params[:category].blank?
      @projects = Project.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @projects = Project.where(:category_id => @category_id)
    end
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
    @project.category_id = params[:category_id]

    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.user=current_user
    @project.category_id = params[:category_id]

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

  def categories
    @categories ||= Category.all.map{|c|[c.name, c.id]}
  end

  private
      def project_params
        params.require(:project).permit(:title, :description, :author, :category_id, :project_img)
      end
end

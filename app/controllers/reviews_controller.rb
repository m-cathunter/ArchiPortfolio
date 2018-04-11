class ReviewsController < ApplicationController

  before_action :find_project

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.project_id = @project.id
    @review.user_id = current_user.id
  end

  if @review.save
    redirect_to project_path(@project)
  else
    render 'new'
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end

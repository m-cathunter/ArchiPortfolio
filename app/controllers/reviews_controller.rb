class ReviewsController < ApplicationController
  before_action :find_project
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.project_id = @project.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    if @review.update(review_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

end

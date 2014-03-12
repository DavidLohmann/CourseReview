class ReviewsController < ApplicationController

  def create
    review = Review.new
    review.title = params[:title]
    review.body = params[:body]
    review.professor = params[:professor]
    review.workload = params[:workload]
    review.focus = params[:focus]
    review.cases = params[:cases]
    review.rating = params[:rating]
    review.course_id = params[:course_id]
    review.user_id = params[:user_id]
    review.save
    redirect_to "/courses/#{review.course_id}/show"
  end

end


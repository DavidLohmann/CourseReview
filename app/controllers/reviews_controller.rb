class ReviewsController < ApplicationController

  def create
    review = Review.new
    review.title = params[:title]
    review.body = params[:body]
    review.professor = params[:professor]
    review.workload = params[:workload]
    review.focus = params[:focus]
    review.cases = params[:cases]
    review.groups = params[:groups]
    review.rating = params[:rating]
    review.course_id = params[:course_id]
    review.user_id = params[:user_id]
    review.save
    redirect_to "/courses/#{review.course_id}/show"
  end

  def show
    @title = "My Reviews"
    @user = User.find_by(:id => params[:user_id])
    @reviews = Review.where(:user_id => @user.id).order('created_at desc')
     if @user.id != session[:user_id]
      redirect_to root_url, notice: "Please Log In to View Your Reviews"
    end
  end

end


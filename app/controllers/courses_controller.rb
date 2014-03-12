class CoursesController < ApplicationController

  def home
  end

  def index
    if params[:dept].present?
      filter_department = Department.find_by(:name => params[:dept])
      @course_list = Course.all.where(:department_id => filter_department.id)
      @course_list = @course_list.order('department_id asc')
    else
      @course_list = Course.all.order('department_id asc')
    end
  end

  def show
    @course = Course.find_by(:id => params[:course_id])
    @reviews = Review.where(:course_id => @course.id).order('created_at desc')
  end

  def destroy
    course = Course.find_by(:id => params[:course_id])
    course.destroy
    redirect_to "/courses", notice: "That course has been deleted!"
  end

  def new
  end

  def create
    course = Course.new
    course.department_id = params["department_id"]
    course.course_code = params["course_code"]
    course.title = params["title"]
    course.description = params["description"]
    course.save
    redirect_to "/courses/#{course.id}/show"
  end

  def edit
    @course = Course.find_by(:id => params[:course_id])
  end

  def update
    course = Course.find_by(:id => params[:course_id])
    course.department_id = params["department_id"]
    course.course_code = params["course_code"]
    course.title = params["title"]
    course.description = params["description"]
    course.save
    redirect_to "/courses/#{course.id}/show"
  end

end

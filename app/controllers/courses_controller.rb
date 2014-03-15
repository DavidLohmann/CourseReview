require 'open-uri'

class CoursesController < ApplicationController

  def home
    user = User.find_by(:id => session[:user_id])
    if user.present?
      @city = "Evanston, IL"
      @url = URI.escape("http://api.openweathermap.org/data/2.5/weather?q=#{@city}&units=imperial")
      @json_data = open(@url).read
      @data = JSON.parse(@json_data)
      @weather= @data["weather"]
    else
        redirect_to root_url, notice: "Please Log In to Access 1Y Course Review"
    end
  end

  def index
    user = User.find_by(:id => session[:user_id])
    if user.present?
      if params[:dept].present?
        filter_department = Department.find_by(:name => params[:dept])
        @course_list = Course.all.where(:department_id => filter_department.id)
        @course_list = @course_list.order('department_id asc', 'course_code asc')
      else
        @course_list = Course.all.order('department_id asc', 'course_code asc')
      end
    else
        redirect_to root_url, notice: "Please Log In to Access 1Y Course Review"
    end
  end

  def show
    user = User.find_by(:id => session[:user_id])
    if user.present?
      @title = "Course Detail"
      @course = Course.find_by(:id => params[:course_id])
      @reviews = Review.where(:course_id => @course.id).order('created_at desc')
    else
      redirect_to root_url, notice: "Please Log In to Access 1Y Course Review"
    end
  end

  def new
    user = User.find_by(:id => session[:user_id])
    if user.present?
    else
      redirect_to root_url, notice: "Please Log In to Access 1Y Course Review"
    end
  end

  def create
    user = User.find_by(:id => session[:user_id])
    if user.present?
      course = Course.new
      course.department_id = params["department_id"]
      course.course_code = params["course_code"]
      course.title = params["title"]
      course.description = params["description"]
      course.save
      redirect_to "/courses/#{course.id}/show"
    else
      redirect_to root_url, notice: "Please Log In to Access 1Y Course Review"
    end
  end

  def edit
    user = User.find_by(:id => session[:user_id])
    if user.present?
      @course = Course.find_by(:id => params[:course_id])
      @department = Department.find_by(:id => @course.department_id)
    else
      redirect_to root_url, notice: "Please Log In to Access 1Y Course Review"
    end
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

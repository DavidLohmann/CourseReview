class UsersController < ApplicationController

  def new
  @title = "Sign Up"
  end

  def show
    @title = "My Profile"
    @user = User.find_by(:id => params[:user_id])
    if @user.id != session[:user_id]
      redirect_to root_url, notice: "Please Log In to Access Your Profile"
    end
  end

  def create
      u = User.new
      u.first_name = params[:first_name]
      u.last_name = params[:last_name]
      u.email = params[:email]
      u.password = params[:password]
      u.city = params[:city]
      u.state = params[:state]
      u.save
      redirect_to root_url, notice: "Please Log In to Access 1Y Course Review"
    end

  def edit
    @title = "Edit Profile"
    @user = User.find_by(:id => params[:user_id])
     if @user.id != session[:user_id]
      redirect_to root_url, notice: "Please Log In to Edit Your Profile"
    end
  end

  def update
    user = User.find_by(:id => params[:user_id])
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.password = params[:password]
    user.city = params[:city]
    user.state = params[:state]
    user.save
    redirect_to "/users/#{user.id}/show"
  end

end

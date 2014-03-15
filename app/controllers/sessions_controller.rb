class SessionsController < ApplicationController

 def new
 end

  def destroy
    reset_session
    redirect_to root_url, notice: "Thanks for visiting 1Y Course Review"
  end

  def create
    user = User.find_by(:email => params[:email])
    if user.present?
      if user.password == params[:password]
        session[:user_id] = user.id
        redirect_to "/home"
      else
        redirect_to root_url, notice: "Unidentified Email or Password."
      end
    else
      redirect_to root_url, notice: "Unknown user."
    end
  end

end
